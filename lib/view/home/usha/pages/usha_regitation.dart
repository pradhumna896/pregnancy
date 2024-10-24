// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:pragnancy_app/widgets/custom_loader.dart';
// import '../../../../core/constants/session_manager.dart';
// import '../../../../data/operations.dart';
// import '../../../../data/state.dart';
// import '../../../../helper/localization_helper.dart';
// import '../../../../theme/app_color.dart';
// import '../../../../theme/text_style.dart';
// import '../../../../theme/theme_helper.dart';
// import '../../../../utils/custom_toast.dart';
// import '../../../../widgets/custom_drodown.dart';
// import '../../../../widgets/custom_eleveted_button.dart';
// import '../../../../widgets/custom_text_field.dart';
// import '../../screen/home_screen.dart';
//
// class UshaRegitationForm extends StatefulWidget {
//   final String title;
//   const UshaRegitationForm({super.key,required this.title});
//
//   @override
//   State<UshaRegitationForm> createState() => _UshaRegitationFormState();
// }
//
// class _UshaRegitationFormState extends State<UshaRegitationForm> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController heightController = TextEditingController();
//   TextEditingController weightController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   TextEditingController tehsilController = TextEditingController();
//   TextEditingController textEditingController = TextEditingController();
//   TextEditingController feetEditingController = TextEditingController();
//   TextEditingController inchEditingController = TextEditingController();
//   // String? selectState;
//   String? selectDistrict;
//   List<String> districtList = [];
//   final formKey = GlobalKey<FormState>();
//   String? selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           CustomTopBarWidget(
//               onPress: () {
//                 Navigator.pop(context);
//               },
//               title: "Registration"),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your name";
//                           }
//                           return null;
//                         },
//                         controller: nameController,
//                         hintText: getLocalized(context, "enter_your_name"),
//                         labelText: getLocalized(context, "name"),
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return getLocalized(
//                                 context, "Please enter your mobile");
//                           }
//                           return null;
//                         },
//                         // readOnly: widget.title == "edit_profile",
//                         controller: mobileController,
//                         textInputType: TextInputType.number,
//                         hintText: getLocalized(context, "enter_mobile_number"),
//                         labelText: getLocalized(context, "mobile_no"),
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(10),
//                           FilteringTextInputFormatter.digitsOnly
//                         ],
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return getLocalized(
//                                 context, "Please enter your age");
//                           }
//                           return null;
//                         },
//                         controller: ageController,
//                         textInputType: TextInputType.phone,
//                         hintText: getLocalized(context, "enter_age"),
//                         labelText: getLocalized(context, "age"),
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                           LengthLimitingTextInputFormatter(3)
//                         ],
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return getLocalized(
//                                 context, "Please enter your height");
//                           }
//                           return null;
//                         },
//                         controller: heightController,
//                         textInputType: TextInputType.phone,
//                         hintText: getLocalized(context, "enter_your_height"),
//                         labelText: getLocalized(context, "height"),
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                           LengthLimitingTextInputFormatter(5)
//                         ],
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return getLocalized(
//                                 context, "Please enter your feet");
//                           }
//                           return null;
//                         },
//                         controller: feetEditingController,
//                         textInputType: TextInputType.phone,
//                         hintText: getLocalized(context, "enter_your_feet"),
//                         labelText: getLocalized(context, "feet"),
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return getLocalized(
//                                 context, "Please enter your inches");
//                           }
//                           return null;
//                         },
//                         controller: inchEditingController,
//                         textInputType: TextInputType.phone,
//                         hintText: getLocalized(context, "enter_your_inches"),
//                         labelText: getLocalized(context, "inches"),
//                       ),
//
//                       SizedBox(height: 20.h),
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return getLocalized(
//                                 context, "Please enter your weight");
//                           }
//                           return null;
//                         },
//                         controller: weightController,
//                         textInputType: TextInputType.phone,
//                         hintText: getLocalized(context, "enter_your_weight"),
//                         labelText: getLocalized(context, "weight"),
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return getLocalized(
//                                 context, "Please enter your date");
//                           }
//                           return null;
//                         },
//                         controller: dateController,
//                         onTap: () async {
//                           DateTime? pickedDate = await showDatePicker(
//                             context: context,
//                             firstDate: DateTime(2023),
//                             lastDate: DateTime.now(),
//                           );
//                           if (pickedDate != null) {
//                             String formattedDate =
//                             DateFormat('yyyy-MM-dd').format(pickedDate);
//                             setState(() {
//                               dateController.text = formattedDate;
//                             });
//                           }
//                         },
//                         readOnly: true,
//                         suffix: const Icon(Icons.calendar_month),
//                         hintText: getLocalized(
//                             context, "enter_your_last_menstrual_start_date"),
//                         labelText:
//                         getLocalized(context, "last_menstrual_start_date"),
//                       ),
//                       SizedBox(height: 20.h),
//                       Text(getLocalized(context, "state")),
//                       Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.grey,width: 1)
//                         ),
//                         width: MediaQuery.of(context).size.width,
//                         child: DropdownButtonHideUnderline(
//                           child: DropdownButton2<String>(
//                             isExpanded: true,
//                             hint: Text(getLocalized(context, "state")),
//                             items: state.map((item) => DropdownMenuItem(
//                               value: item["state"].toString(),
//                               child: Text(item["state"].toString(),
//                                 style: TextStyle(color: Colors.black87, fontSize: 14.sp,fontWeight: FontWeight.w400,),
//                               ),
//                             )).toList(),
//                             value: selectedValue,
//                             onChanged: (value) {
//                               selectedValue = value;
//                               for (var i in state) {
//                                 if (i["state"] == selectedValue) {
//                                   setState(() {
//                                     districtList = i["districts"];
//                                   });
//                                 }
//
//                               }
//                             },
//                             buttonStyleData: const ButtonStyleData(
//                               padding: EdgeInsets.symmetric(horizontal: 16),
//                               height: 40,
//                               width: 200,
//                             ),
//                             dropdownStyleData: const DropdownStyleData(
//                               maxHeight: 200,
//                             ),
//                             menuItemStyleData: const MenuItemStyleData(
//                               height: 40,
//                             ),
//                             dropdownSearchData: DropdownSearchData(
//                               searchController: textEditingController,
//                               searchInnerWidgetHeight: 50,
//                               searchInnerWidget: Container(
//                                 height: 50,
//                                 padding: const EdgeInsets.only(
//                                   top: 8,
//                                   bottom: 4,
//                                   right: 8,
//                                   left: 8,
//                                 ),
//                                 child: TextFormField(
//                                   expands: true,
//                                   maxLines: null,
//                                   controller: textEditingController,
//                                   textCapitalization: TextCapitalization.sentences,
//                                   decoration: InputDecoration(
//                                     isDense: true,
//                                     contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
//                                     hintText: getLocalized(context, "state"),
//                                     hintStyle: const TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w400),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(5),
//                                       borderSide:
//                                       BorderSide(color: AppColor.primary.withOpacity(0.2), width: 1),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(5),
//                                         borderSide: const BorderSide(color: AppColor.primary, width: 1)),
//                                     errorBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(5),
//                                         borderSide: BorderSide(color: Colors.red.withOpacity(0.8), width: 1)),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(5),
//                                         borderSide:
//                                         BorderSide(color: appTheme.orange.withOpacity(0.2), width: 1)),
//                                     disabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(5),
//                                         borderSide: const BorderSide(color: Colors.grey, width: 1)),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(5),
//                                         borderSide: const BorderSide(color: Colors.grey, width: 1)),
//                                   ),
//                                   onChanged: (value) {
//                                     for (var i in state) {
//                                       if (i["state"] == selectedValue) {
//                                         setState(() {
//                                           districtList = i["districts"];
//                                         });
//                                       }
//                                     }
//                                   },
//                                 ),
//                               ),
//                               searchMatchFn: (item, searchValue) {
//                                 return item.value.toString().contains(searchValue);
//                               },
//                             ),
//                             onMenuStateChange: (isOpen) {
//                               if (!isOpen) {
//                                 textEditingController.clear();
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       if (selectedValue != null)
//                         CustomDropdown(
//                           validator: (p0) {
//                             if (p0 == null) {
//                               return "please select district";
//                             }
//                             return null;
//                           },
//                           labelText: getLocalized(context, "district"),
//                           listName: districtList,
//                           onChng: (p0) {
//                             selectDistrict = p0;
//                           },
//                         ),
//                       SizedBox(height: 20),
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return getLocalized(context, "Please enter your city");
//                           }
//                           return null;
//                         },
//                         controller: cityController,
//                         hintText: getLocalized(context, "enter_your_city"),
//                         labelText: getLocalized(context, "city"),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       CustomTextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return getLocalized(
//                                 context, "Please enter your tehsil");
//                           }
//                           return null;
//                         },
//                         controller: tehsilController,
//                         hintText: getLocalized(context, "enter_your_tehsil"),
//                         labelText: getLocalized(context, "tehsil"),
//                       ),
//                       SizedBox(height: 20.h),
//                       Mutation(
//                         options: MutationOptions(
//                           document: gql(Operations.register),
//                           onCompleted: (resultData) {
//                             if (resultData != null) {
//                               showSuccessToast(toast,
//                                   widget.title == "edit_profile"
//                                       ? "Edit Profile Successfully"
//                                       : "Register successfully");
//                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
//                               widget.title == "add_family_members"
//                                   ? HomeScreen()
//                                   : widget.title == "edit_profile"
//                                   ? HomeScreen()
//                                   : HomeScreen(),
//                               ),
//                                     (route) => false,
//                               );
//                             }
//                           },
//                           onError: (error) {
//                             showErrorToast(toast, error!.graphqlErrors[0].message);
//                             print("object ----------- error ${error.graphqlErrors[0].message}");
//                           },
//                         ),
//                         builder: (RunMutation runMutation, QueryResult? result) {
//                           return result!.isLoading
//                               ? const CustomLoader()
//                               : CustomElevatedButton(
//                             onTap: () async{
//                               if (formKey.currentState!.validate()) {
//                                  runMutation({
//                                     "registerData": {
//                                       "age": int.parse(ageController.text),
//                                       "height": heightController.text.trim(),
//                                       "mobileNo": mobileController.text.trim(),
//                                       "name": nameController.text.trim(),
//                                       "weight": weightController.text.trim(),
//                                       "lastMenstrualDate": dateController.text.trim(),
//                                       "isLoggedIn": false, // add is field
//                                       "city": cityController.text.trim(),
//                                       "district": selectDistrict,
//                                       "state": selectedValue,
//                                       "tehsil": tehsilController.text.trim(),
//                                       "userType": "patient",
//                                       "parentId": int.parse(SessionManager.getUserId()!),
//                                     }
//                                   });
//                                 }
//                             },
//                             text: Text(getLocalized(context, "done"),
//                               style: KtxtStyle().text18White700,
//                             ),
//                           );
//                         },
//                       ),
//                       SizedBox(height: 20.h),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:pragnancy_app/comman/routes/routes.dart';
import 'package:pragnancy_app/data/operations.dart';
import 'package:pragnancy_app/data/state.dart';
import 'package:pragnancy_app/utils/custom_toast.dart';
import 'package:pragnancy_app/utils/time_formate_methode.dart';
import 'package:pragnancy_app/view/auth/screen/login_screen.dart';
import 'package:pragnancy_app/view/settings/screen/settings_screen.dart';
import 'package:pragnancy_app/widgets/custom_drodown.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';
import '../../../../hiveData/modelHive.dart';
import '../../../../theme/theme_helper.dart';


class UshaRegitationForm extends StatefulWidget {
  final String title;
  final int? id;
  final user;
  const UshaRegitationForm({super.key, required this.title, this.id, this.user});

  @override
  State<UshaRegitationForm> createState() => _UshaRegitationFormState();
}

class _UshaRegitationFormState extends State<UshaRegitationForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController tehsilController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController feetEditingController = TextEditingController();
  TextEditingController inchEditingController = TextEditingController();
  // String? selectState;
  String? selectDistrict;
  List<String> districtList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        toast.init(context);
      },
    );

    if (widget.title == "edit_profile") getData();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        syncDataWithApi();
      }
    });
    super.initState();
  }

  Future<void> syncDataWithApi() async {
    final box = await Hive.openBox<UserData>('userData');
    final userDataList = box.values.toList();

    for (UserData userData in userDataList) {
      Operations.register;
      // Call your GraphQL mutation
      // runMutation({...}) - Replace with your actual GraphQL mutation call
      await box.delete(userData); // Delete after successful sync
    }
  }

  getData() {
    nameController.text = widget.user["name"];
    mobileController.text = widget.user["mobileNo"];
    ageController.text = widget.user["age"].toString();
    // heightController.text = widget.user["height"].toString();
    feetEditingController.text = widget.user["feet"].toString();
    inchEditingController.text = widget.user["inches"].toString();
    weightController.text = widget.user["weight"].toString();
    dateController.text = TimeFormateMethod().getTimeFormate(time: widget.user["lastMenstrualDate"]);
  }
  String? selectedValue;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBarWidget(
              onPress: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
                widget.title == "registration" ? LoginScreen() : HomeScreen(),
                ), (route) => false,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        readOnly: widget.title == "edit_profile",
                        controller: mobileController,
                        textInputType: TextInputType.number,
                        hintText: getLocalized(context, "enter_mobile_number"),
                        labelText: getLocalized(context, "mobile_no"),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                        textInputType: TextInputType.phone,
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
                        textInputType: TextInputType.phone,
                        hintText: getLocalized(context, "enter_your_weight"),
                        labelText: getLocalized(context, "weight"),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
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
                      Text(getLocalized(context, "state")),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey,width: 1)
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(getLocalized(context, "state")),
                            items: state.map((item) => DropdownMenuItem(
                              value: item["state"].toString(),
                              child: Text(item["state"].toString(),
                                style: TextStyle(color: Colors.black87, fontSize: 14.sp,fontWeight: FontWeight.w400,),
                              ),
                            )).toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              selectedValue = value;
                              for (var i in state) {
                                if (i["state"] == selectedValue) {
                                  setState(() {
                                    districtList = i["districts"];
                                  });
                                }

                              }
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 40,
                              width: 200,
                            ),
                            dropdownStyleData: const DropdownStyleData(
                              maxHeight: 200,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                            dropdownSearchData: DropdownSearchData(
                              searchController: textEditingController,
                              searchInnerWidgetHeight: 50,
                              searchInnerWidget: Container(
                                height: 50,
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 4,
                                  right: 8,
                                  left: 8,
                                ),
                                child: TextFormField(
                                  expands: true,
                                  maxLines: null,
                                  controller: textEditingController,
                                  textCapitalization: TextCapitalization.sentences,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                    hintText: getLocalized(context, "state"),
                                    hintStyle: const TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                      BorderSide(color: AppColor.primary.withOpacity(0.2), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(color: AppColor.primary, width: 1)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.red.withOpacity(0.8), width: 1)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide:
                                        BorderSide(color: appTheme.orange.withOpacity(0.2), width: 1)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(color: Colors.grey, width: 1)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(color: Colors.grey, width: 1)),
                                  ),
                                  onChanged: (value) {
                                    for (var i in state) {
                                      if (i["state"] == selectedValue) {
                                        setState(() {
                                          districtList = i["districts"];
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),
                              searchMatchFn: (item, searchValue) {
                                return item.value.toString().contains(searchValue);
                              },
                            ),
                            onMenuStateChange: (isOpen) {
                              if (!isOpen) {
                                textEditingController.clear();
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),



                      if (selectedValue != null)
                        CustomDropdown(
                          validator: (p0) {
                            if (p0 == null) {
                              return "please select district";
                            }
                            return null;
                          },
                          labelText: getLocalized(context, "district"),
                          listName: districtList,
                          onChng: (p0) {
                            selectDistrict = p0;
                          },
                        ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return getLocalized(context, "Please enter your city");
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return getLocalized(
                                context, "Please enter your tehsil");
                          }
                          return null;
                        },
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
                          document: gql(widget.title == "edit_profile"
                              ? Operations.editProfile
                              : Operations.register),
                          onCompleted: (resultData) {
                            if (resultData != null) {
                              showSuccessToast(toast, "Register successfully");
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()),
                                    (route) => false);
                            }
                          },
                          onError: (error) {
                            showErrorToast(toast, error!.graphqlErrors[0].message);
                            print("object ----------- error ${error.graphqlErrors[0].message}");
                          },
                        ),
                        builder: (RunMutation runMutation, QueryResult? result) {
                          return result!.isLoading
                              ? const CustomLoader()
                              : CustomElevatedButton(
                            onTap: () async{
                              if (formKey.currentState!.validate()) {
                                final connectivityResult = await Connectivity().checkConnectivity();
                                if (connectivityResult == ConnectivityResult.none){
                                  final userData = UserData(
                                      name: nameController.text.trim(),
                                      mobileNo: mobileController.text.trim(),
                                      age: int.parse(ageController.text),
                                      height: heightController.text.trim(),
                                      weight: weightController.text.trim(),
                                      lastMenstrualDate: dateController.text.trim(),
                                      city: cityController.text.trim(),
                                      dist: selectDistrict.toString(),
                                      state: selectedValue.toString(),
                                      teh: tehsilController.text.trim(),
                                      userType: "patient",
                                      pId: "${widget.title == "add_family_members" ? widget.id : null}",
                                      isLog: false
                                  );
                                  showSuccessToast(toast,"$userData");
                                  final box = await Hive.openBox<UserData>('userData');
                                  await box.add(userData);
                                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data saved locally!")));
                                }else{
                                  widget.title == "edit_profile" ?
                                  runMutation({
                                    "data": {
                                      "age": int.parse(ageController.text),
                                      "createdBy": widget.user["createdBy"],
                                      "email": null,
                                      "height": heightController.text,
                                      "id": widget.user["id"],
                                      "isLoggedIn": false,
                                      "lastMenstrualDate": dateController.text,
                                      "mobileNo": mobileController.text,
                                      "name": nameController.text,
                                      "parentId": widget.user["id"],
                                      "weight": weightController.text,
                                      "maternityId": int.parse(SessionManager.getMaternityId().toString()),
                                      "state": selectedValue,
                                      "tehsil": tehsilController.text,
                                      "userType": "patient",
                                      "city": cityController.text,
                                    }
                                  })
                                      : runMutation({
                                    "registerData": {
                                      "age": int.parse(ageController.text),
                                      "feet": feetEditingController.text,
                                      "inches": inchEditingController.text,
                                      "mobileNo": mobileController.text.trim(),
                                      "name": nameController.text.trim(),
                                      "weight": weightController.text.trim(),
                                      "lastMenstrualDate": dateController.text.trim(),
                                      "isLoggedIn": false, // add is field
                                      "city": cityController.text.trim(),
                                      "district": selectDistrict,
                                      "state": selectedValue,
                                      "tehsil": tehsilController.text.trim(),
                                      "userType": "patient",
                                      "parentId":  int.parse(SessionManager.getUserId()!),
                                    }
                                  });
                                }
                              }
                            },
                            text: Text(getLocalized(context, "done"),
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
        ],
      ),
    );
  }
}