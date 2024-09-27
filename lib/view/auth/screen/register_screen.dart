import 'package:easy_localization/easy_localization.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/comman/routes/routes.dart';
import 'package:pragnancy_app/utils/custom_toast.dart';
import 'package:pragnancy_app/utils/time_formate_methode.dart';
import 'package:pragnancy_app/view/auth/screen/login_screen.dart';
import 'package:pragnancy_app/view/settings/screen/settings_screen.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';

class RegisterScreen extends StatefulWidget {
  final String title;
  final int? id;
  final user;
  const RegisterScreen({super.key, required this.title, this.id, this.user});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  String register = r'''
mutation Register($registerData: RegisterDto!) {
  register(registerData: $registerData) {
    id
    name
    mobileNo
    email
    age
    height
    weight
    lastMenstrualDate
    createdAt
    updatedAt
    isLoggedIn
  }
}
''';
  String addFamilyMember =
      r'''mutation CreateFamilyMember($createUserDto: CreateUserDto!) {
  createFamilyMember(createUserDto: $createUserDto) {
    id
    name
    mobileNo
    email
    age
    height
    weight
    isLoggedIn
    lastMenstrualDate
    createdBy
    role
    createdAt
    updatedAt
    parentId
    maternityId
  }
}''';

  String editProfile = r'''mutation EditProfile($data: UpdateUserDto!) {
  editProfile(data: $data) {
    id
    name
    mobileNo
    email
    age
    height
    weight
    isLoggedIn
    lastMenstrualDate
    createdBy
    role
    createdAt
    updatedAt
    parentId
    maternityId
  }
}''';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        toast.init(context);
      },
    );

    if (widget.title == "edit_profile") getData();
    super.initState();
  }

  getData() {
    nameController.text = widget.user["name"];
    mobileController.text = widget.user["mobileNo"];
    ageController.text = widget.user["age"].toString();
    heightController.text = widget.user["height"].toString();
    weightController.text = widget.user["weight"].toString();
    dateController.text = TimeFormateMethod()
        .getTimeFormate(time: widget.user["lastMenstrualDate"]);
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBarWidget(
              onPress: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widget.title == "registration"
                        ? LoginScreen()
                        : HomeScreen(),
                  ),
                  (route) => false,
                );
              },
              title: getLocalized(context, widget.title)),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        controller: nameController,
                        hintText: getLocalized(context, "enter_your_name"),
                        labelText: getLocalized(context, "name"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return getLocalized(
                                context, "Please enter your mobile");
                          }
                        },
                        readOnly: widget.title == "edit_profile",
                        controller: mobileController,
                        hintText: getLocalized(context, "enter_mobile_number"),
                        labelText: getLocalized(context, "mobile_no"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return getLocalized(
                                context, "Please enter your age");
                          }
                        },
                        controller: ageController,
                        hintText: getLocalized(context, "enter_age"),
                        labelText: getLocalized(context, "age"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return getLocalized(
                                context, "Please enter your height");
                          }
                        },
                        controller: heightController,
                        hintText: getLocalized(context, "enter_your_height"),
                        labelText: getLocalized(context, "height"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return getLocalized(
                                context, "Please enter your weight");
                          }
                        },
                        controller: weightController,
                        hintText: getLocalized(context, "enter_your_weight"),
                        labelText: getLocalized(context, "weight"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return getLocalized(
                                context, "Please enter your date");
                          }
                        },
                        controller: dateController,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2023),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              dateController.text = formattedDate;
                            });
                          }
                        },
                        readOnly: true,
                        suffix: const Icon(Icons.calendar_month),
                        hintText: getLocalized(
                            context, "enter_your_last_menstrual_start_date"),
                        labelText:
                            getLocalized(context, "last_menstrual_start_date"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Mutation(
                        options: MutationOptions(
                          document: gql(widget.title == "add_family_members"
                              ? addFamilyMember
                              : widget.title == "edit_profile"
                                  ? editProfile
                                  : register),
                          onCompleted: (resultData) {
                            if (resultData != null) {
                              showSuccessToast(
                                  toast,
                                  widget.title == "add_family_members"
                                      ? "Family Add Successfully"
                                      : widget.title == "edit_profile"
                                          ? "Edit Profile Successfully"
                                          : "Register successfully");
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      widget.title == "add_family_members"
                                          ? SettingsScreen()
                                          : widget.title == "edit_profile"
                                              ? SettingsScreen()
                                              : const LoginScreen(),
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
                        builder:
                            (RunMutation runMutation, QueryResult? result) {
                          return result!.isLoading
                              ? const CustomLoader()
                              : CustomElevatedButton(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      widget.title == "add_family_members"
                                          ? runMutation({
                                              "createUserDto": {
                                                "weight": weightController.text
                                                    .trim(),
                                                "parentId": widget.id,
                                                "name":
                                                    nameController.text.trim(),
                                                "mobileNo": mobileController
                                                    .text
                                                    .trim(),
                                                "lastMenstrualDate":
                                                    dateController.text.trim(),
                                                "isLoggedIn": false,
                                                "height": heightController.text
                                                    .trim(),
                                                "email": null,
                                                "createdBy": widget.id,
                                                "age": int.parse(
                                                    ageController.text),
                                                "role": "user",
                                                "maternityId": int.parse(
                                                    SessionManager
                                                            .getMaternityId()
                                                        .toString()),
                                              }
                                            })
                                          : widget.title == "edit_profile"
                                              ? runMutation({
                                                  "data": {
                                                    "age": int.parse(
                                                        ageController.text),
                                                    "createdBy": widget
                                                        .user["createdBy"],
                                                    "email": null,
                                                    "height":
                                                        heightController.text,
                                                    "id": widget.user["id"],
                                                    "isLoggedIn": false,
                                                    "lastMenstrualDate":
                                                        dateController.text,
                                                    "mobileNo":
                                                        mobileController.text,
                                                    "name": nameController.text,
                                                    "parentId":
                                                        widget.user["id"],
                                                    "weight":
                                                        weightController.text,
                                                    "role": "user",
                                                    "maternityId": int.parse(
                                                        SessionManager
                                                                .getMaternityId()
                                                            .toString())
                                                  }
                                                })
                                              : runMutation({
                                                  "registerData": {
                                                    "age": int.parse(
                                                        ageController.text),
                                                    "height": heightController
                                                        .text
                                                        .trim(),
                                                    "mobileNo": mobileController
                                                        .text
                                                        .trim(),
                                                    "name": nameController.text
                                                        .trim(),
                                                    "weight": weightController
                                                        .text
                                                        .trim(),
                                                    "role": "user",
                                                    "lastMenstrualDate":
                                                        dateController.text
                                                            .trim(),
                                                    "isLoggedIn": false,
                                                  }
                                                });
                                    }
                                  },
                                  text: Text(
                                    getLocalized(context, "done"),
                                    style: KtxtStyle().text18White700,
                                  ),
                                );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
