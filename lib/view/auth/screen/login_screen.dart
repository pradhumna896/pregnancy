import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/comman/routes/routes.dart';
import 'package:pragnancy_app/utils/custom_toast.dart';
import 'package:pragnancy_app/view/auth/screen/register_screen.dart';
import 'dart:async';

import 'package:pragnancy_app/widgets/custom_loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    toast.init(context);
    super.initState();
  }

  bool _isSending = false;
  int _countdown = 10; // Countdown duration in seconds
  Timer? _timer;
  Completer<void>? _completer;

  @override
  void dispose() {
    _cancelTimer(); // Cancel the timer when the widget is disposed
    _completer
        ?.complete(); // Complete the completer to avoid lingering callbacks
    _focusNode.dispose();
    super.dispose();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _sendOtp() async {
    setState(() {
      _isSending = true;
      _countdown = 60; // Reset countdown duration
    });

    _completer = Completer<void>();

    // Simulate sending OTP
    await Future.delayed(Duration(seconds: 2));

    if (_completer!.isCompleted) {
      return; // Check if the completer is already completed
    }

    if (mounted) {
      _startCountdown();
    }
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown == 0) {
        _cancelTimer();
        if (mounted) {
          setState(() {
            _isSending = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _countdown--;
          });
        }
      }
    });
  }

  final formKey = GlobalKey<FormState>();
  String otpRequest = r'''
 mutation RequestOtp($otpRequestData: OtpRequestDto!) {
  requestOtp(otpRequestData: $otpRequestData){
    otp
  }
}
  ''';
  String login = r'''
  mutation Login($loginData: LoginDto!) {
  login(loginData: $loginData) {
    accessToken
    user {
      age
      createdAt
      email
      height
      id
      lastMenstrualDate
      mobileNo
      name
      updatedAt
      weight
      maternityId
    }
  }
}
   ''';
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFFFBFBC),
            ]),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 37.h,
            left: 37.w,
            right: 37.w,
            child: CustomImageView(
              imagePath: "asset/images/logo.png",
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  )),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Mutation(
                      options: MutationOptions(
                          onCompleted: (data) {
                            if (data != null) {
                              // showSuccessToast(toast, "OTP Send Successfully");
                              _sendOtp();
                            }
                            print(data);
                          },
                          onError: (error) {
                            showErrorToast(
                                toast, error!.graphqlErrors[0].message);
                          },
                          document: gql(otpRequest)),
                      builder: (runMutation, result) {
                        result!.data == null
                                ?otpController.text = ""
                                :otpController.text =  result.data!["requestOtp"]["otp"];
                        print(result);
                        return Column(
                          children: [
                            CustomTextFormField(
                              focusNode: _focusNode,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty && value.length <= 10) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                              controller: mobileController,
                              labelStyle: KtxtStyle().text18White700,
                              labelText: getLocalized(context, "mobile_no"),
                              hintText:
                                  getLocalized(context, "enter_mobile_number"),
                            ),
                            if (_isSending)
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Please wait $_countdown seconds',
                                  style: KtxtStyle().text14Whitew700,
                                ),
                              ),
                            if (!_isSending)
                              Container(
                                margin: EdgeInsets.only(top: 50),
                                child: result.isLoading
                                    ? const CustomLoader()
                                    : CustomElevatedButton(
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            runMutation({
                                              "otpRequestData": {
                                                "mobileNo":
                                                    mobileController.text
                                              }
                                            });
                                          }
                                        },
                                        text: Text(
                                          "Send OTP",
                                          style: KtxtStyle().text20Primary600,
                                        )),
                              ),
                          
                            if (_isSending)
                              CustomTextFormField(
                                focusNode: _focusNode,
                                controller: otpController,
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter OTP';
                                  }
                                  return null;
                                },
                                labelStyle: KtxtStyle().text18White700,
                                labelText: getLocalized(context, "otp"),
                                hintText: getLocalized(context, "enter_otp"),
                              ),
                            if (_isSending)
                              SizedBox(
                                height: 50.h,
                              ),
                            if (_isSending)
                              Mutation(
                                options: MutationOptions(
                                  document: gql(login),
                                  onCompleted: (data) {
                                    if (data != null) {
                                      print(data);
                                      SessionManager.setToken(
                                          data["login"]["accessToken"]);
                                      SessionManager.setUserId(data["login"]
                                              ["user"]["id"]
                                          .toString());
                                      SessionManager.setMaternityId(
                                          data["login"]["user"]["maternityId"]
                                              .toString());
                                      SessionManager.setName(
                                          data["login"]["user"]["name"]);
                                      print(SessionManager.getMaternityId());
                                      showSuccessToast(
                                          toast, "Login Successfully");
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    }
                                  },
                                  onError: (error) {
                                    showErrorToast(
                                        toast, error!.graphqlErrors[0].message);
                                  },
                                ),
                                builder: (runMutation, result) {
                                  return result!.isLoading
                                      ? const CustomLoader()
                                      : CustomElevatedButton(
                                          onTap: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              runMutation({
                                                "loginData": {
                                                  "mobileNo": mobileController
                                                      .text
                                                      .trim(),
                                                  "otp":
                                                      otpController.text.trim()
                                                }
                                              });
                                            }
                                          },
                                          text: Text(
                                            getLocalized(context, "login"),
                                            style: KtxtStyle().text20Primary600,
                                          ));
                                },
                              ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 100,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(
                                title: "registration",
                              ),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(getLocalized(context, "don't_have_account"),
                              style: KtxtStyle().text20White400),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(getLocalized(context, "signup"),
                              style: KtxtStyle().text20DarkBlackw700),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
}
