
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../comman/routes/routes.dart';
import '../../../core/error_handler.dart';
import '../../../data/state.dart';
import '../../../utils/custom_toast.dart';
import '../../../utils/time_formate_methode.dart';
import '../../../widgets/custom_drodown.dart';
import '../../../widgets/custom_loader.dart';



class NewRegistation extends StatefulWidget {
  String title;
 NewRegistation({super.key,required this.title});

  @override
  State<NewRegistation> createState() => _NewRegistationState();
}

class _NewRegistationState extends State<NewRegistation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController tehsilController = TextEditingController();
  TextEditingController feetEditingController = TextEditingController();
  TextEditingController inchEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? selectState;
  String? selectDistrict;
  List<String> districtList = [];

  String userFind = r'''query FindUserById($findUserByIdId: Float!) {
  findUserById(id: $findUserByIdId) {
    id
    name
    mobileNo
    email
    age
    feet
    inches
    weight
    status
    isLoggedIn
    lastMenstrualDate
    createdBy
    createdAt
    updatedAt
    userType
    slug
    parentId
    superParentId
    state
    district
    city
    tehsil
    maternityId
  }
}''';

  static const String editProfile =
  r'''mutation EditProfile($data: UpdateUserDto!) {
  editProfile(data: $data) {
    id
    name
    mobileNo
    email
    age
    feet
    inches
    weight
    status
    isLoggedIn
    lastMenstrualDate
    createdBy
    deviceToken
    createdAt
    updatedAt
    userType
    slug
    parentId
    superParentId
    state
    district
    city
    tehsil
    maternityId
  }
}''';
  void initState() {
    super.initState();
    initToast(context); // Make sure toast is initialized here
  }
  void initToast(BuildContext context) {
    // Initialize your toast library here
    toast.init(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(
          document: gql(userFind),
          variables: {
            "findUserByIdId": int.parse(SessionManager.getUserId()!)
          },
          onError: (error) {
            if (error!.graphqlErrors[0].message == "Unauthorized") {
              authorized(context);
            }
          },
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception!.graphqlErrors[0].message);
          }
          if (result.isLoading) {
            return const Center(child: CustomLoader());
          }
          var user = result.data!["findUserById"];
          nameController.text = user['name'].toString();
          mobileController.text = user['mobileNo'].toString();
          ageController.text = user['age'].toString();
          // heightController.text = user["height"].toString();
          weightController.text = user["weight"].toString();
          feetEditingController.text = user["feet"].toString();
          inchEditingController.text = user["inches"].toString();
          tehsilController.text = user['tehsil'].toString();
          cityController.text = user['city'].toString();
          dateController.text = TimeFormateMethod().getTimeFormate(time: user["lastMenstrualDate"]);
          return Column(
              children: [
                CustomTopBarWidget(
                    title: getLocalized(context, widget.title)
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              validator: (value) {
                                if (value!.isEmpty|| value.trim().isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              },
                              controller: nameController,
                              hintText: getLocalized(context, "enter_your_name"),
                              labelText: getLocalized(context, "name"),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30)
                              ],
                            ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return getLocalized(
                                      context, "Please enter your mobile");
                                }
                                return null;
                              },
                              readOnly: true,
                              controller: mobileController,
                              hintText: getLocalized(context, "enter_mobile_number"),
                              labelText: getLocalized(context, "mobile_no"),
                            ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return getLocalized(
                                      context, "Please enter your age");
                                }
                                return null;
                              },
                              controller: ageController,
                              hintText: getLocalized(context, "enter_age"),
                              labelText: getLocalized(context, "age"),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3)
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return getLocalized(
                                            context, "Please enter your feet");
                                      }
                                      return null;
                                    },
                                    controller: feetEditingController,
                                    textInputType: TextInputType.phone,
                                    hintText: getLocalized(context, "enter_your_feet"),
                                    labelText: getLocalized(context, "feet"),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(2)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return getLocalized(
                                            context, "Please enter your inches");
                                      }
                                      return null;
                                    },
                                    controller: inchEditingController,
                                    textInputType: TextInputType.phone,
                                    hintText: getLocalized(context, "enter_your_inches"),
                                    labelText: getLocalized(context, "inches"),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(2)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return getLocalized(
                                      context, "Please enter your weight");
                                }
                                return null;
                              },
                              controller: weightController,
                              hintText: getLocalized(context, "enter_your_weight"),
                              labelText: getLocalized(context, "weight"),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3)
                              ],
                            ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return getLocalized(
                                      context, "Please enter your date");
                                }
                                return null;
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
                            SizedBox(height: 20.h),
                            CustomDropdown(
                              // validator: (p0) {
                              //   if (p0 == null) {
                              //     return "please select state";
                              //   }
                              //   return null;
                              // },
                              labelText: getLocalized(context, "state"),
                              listName: state.map((e) {
                                return e["state"].toString();
                              }).toList(),
                              onChng: (p0) {
                                selectState = p0;
                                for (var i in state) {
                                  if (i["state"] == selectState) {
                                    setState(() {
                                      districtList = i["districts"];
                                    });
                                  }
                                }
                              },
                            ),
                            if (selectState != null)
                              CustomDropdown(
                                // validator: (p0) {
                                //   if (p0 == null) {
                                //     return "please select district";
                                //   }
                                //   return null;
                                // },
                                labelText: getLocalized(context, "district"),
                                listName: districtList,
                                onChng: (p0) {
                                  selectDistrict = p0;
                                },
                              ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return getLocalized(
                              //         context, "Please enter your city");
                              //   }
                              //   return null;
                              // },
                              controller: cityController,
                              hintText: getLocalized(context, "enter_your_city"),
                              labelText: getLocalized(context, "city"),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20)
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return getLocalized(
                              //         context, "Please enter your tehsil");
                              //   }
                              //   return null;
                              // },
                              controller: tehsilController,
                              hintText: getLocalized(context, "enter_your_tehsil"),
                              labelText: getLocalized(context, "tehsil"),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20)
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Mutation(
                              options: MutationOptions(
                                document: gql(editProfile),
                                onCompleted: (resultData) {
                                  if (resultData != null) {
                                    showSuccessToast(toast, "Edit Profile Successfully");
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                                  }
                                },
                                onError: (error) {
                                  showErrorToast(toast, error!.graphqlErrors[0].message);
                                  print(error.graphqlErrors[0].message);
                                },
                              ),
                              builder: (RunMutation runMutation, QueryResult? result) {
                                return result!.isLoading
                                    ? const CustomLoader()
                                    : CustomElevatedButton(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      runMutation({
                                        "data": {
                                          "age": int.parse(ageController.text),
                                          "createdBy": null,
                                          "email": null,
                                          "feet": feetEditingController.text,
                                          "inches": inchEditingController.text,
                                          "id": user["id"].toString(),
                                          "isLoggedIn": false,
                                          "lastMenstrualDate": dateController.text,
                                          "name": nameController.text,
                                          "parentId": null,
                                          "weight": weightController.text,
                                          "maternityId": int.parse(SessionManager.getMaternityId().toString()),
                                          "state": selectState,
                                          "tehsil": tehsilController.text,
                                          "userType": "patient",
                                          "city": cityController.text,
                                          "district": selectDistrict,
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
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]
          );
        },),
    );
  }
}