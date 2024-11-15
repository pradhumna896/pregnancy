import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/comman/routes/routes.dart';
import 'package:pragnancy_app/data/operations.dart';
import 'package:pragnancy_app/utils/custom_toast.dart';
import 'package:pragnancy_app/utils/time_formate_methode.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';

class AncCheckupInformationScreen extends StatefulWidget {
  const AncCheckupInformationScreen({super.key});

  @override
  State<AncCheckupInformationScreen> createState() =>
      _AncCheckupInformationScreenState();
}

class _AncCheckupInformationScreenState
    extends State<AncCheckupInformationScreen> {
  final TextEditingController _weightControllers = TextEditingController();

  final TextEditingController _bloodPressureControllers = TextEditingController();

  final TextEditingController _hemoGlobinControllers = TextEditingController();

  final TextEditingController _testDateControllers = TextEditingController();

 
  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  void dispose() {
    _weightControllers.dispose();
    _bloodPressureControllers.dispose();
    _hemoGlobinControllers.dispose();
    _testDateControllers.dispose();

    super.dispose();
  }

  final formKeys = GlobalKey<FormState>();
  bool isCompletedExpanded = false;
  bool isNotCompletedExpanded = true;

  TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomTopBarWidget(title: "anc_checkup"),
          Query(
              options: QueryOptions(
                document: gql(Operations.ancCheckup),
                variables: {
                  "maternityId":
                      int.parse(SessionManager.getMaternityId().toString())
                },
                onComplete: (data) {
                  print(data);
                },
                onError: (error) {
                  print(error);
                },
              ),
              builder: (result, {fetchMore, refetch}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }
                if (result.isLoading) {
                  return const Center(child: CustomLoader());
                }
                List healthData = result.data!['getCheckupsByMaternityId'];
                List completedCheckups = healthData.where((checkup) => checkup['isCompleted'] == true).toList();
                List notCompletedCheckups = healthData.where((checkup) => checkup['isCompleted'] == false).toList();

                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ExpansionPanelList(
                          dividerColor: AppColor.secondary,
                          expandedHeaderPadding: EdgeInsets.zero,
                          expandIconColor: Colors.white,
                          elevation: 1,
                          children: [
                            ExpansionPanel(
                              backgroundColor: AppColor.secondary,
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  onTap: () {
                                  setState(() {
                                      isNotCompletedExpanded =!isNotCompletedExpanded;
                                  });
                                  },
                                  title: Text(
                                    "Not Completed Checkups",
                                    style: KtxtStyle().text16DarkWhitew600,
                                  ),
                                );
                              },
                              body: Column(
                                  children: List.generate(1, (index) {
                                  _weightControllers.text = notCompletedCheckups[index]['weight'].toString();
                                  _bloodPressureControllers.text = notCompletedCheckups[index]['bloodPressure'] ?? "";
                                  _hemoGlobinControllers.text = notCompletedCheckups[index]["hemoGlobin"] ?? "";
                                  _testDateControllers.text = notCompletedCheckups[index]['testDate'] != null
                                          ? TimeFormateMethod().getTimeFormate(formate: "yyyy-MM-dd", time: notCompletedCheckups[index]['testDate'].toString())
                                          : "";
                                  return Card(
                                    surfaceTintColor: const Color(0xFFF0F0F0),
                                    margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                                      child: Form(
                                        key: formKeys,
                                        child: Column(
                                          children: [
                                            Text(getLocalized(context,"${notCompletedCheckups[index]["weekNumber"].toString()} ए.एन.सी. चेकअप"),
                                              style: KtxtStyle().text20DarkBlackw700,
                                            ),

                                            // TextFormField(
                                            //   controller: _controller,
                                            //   readOnly: true,
                                            //   validator: (value) {
                                            //     if (value!.isEmpty) {
                                            //       return "please select date";
                                            //     }
                                            //     return null;
                                            //   },
                                            //   decoration: InputDecoration(
                                            //     isDense: true,
                                            //     labelText: getLocalized(context, "date"),
                                            //     hintText: getLocalized(context, "enter_your_date"),
                                            //     contentPadding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                                            //     fillColor: AppColor.white,
                                            //     filled: true,
                                            //     suffixIcon: const Icon(Icons.calendar_month,size: 20,color: AppColor.black),
                                            //     enabledBorder: OutlineInputBorder(
                                            //           borderRadius: BorderRadius.circular(10.r),
                                            //           borderSide: const BorderSide(
                                            //             color: Color(0xffD4D0D0),
                                            //             width: 1,
                                            //           ),
                                            //         ),
                                            //     focusedBorder: OutlineInputBorder(
                                            //           borderRadius: BorderRadius.circular(10.r),
                                            //           borderSide: const BorderSide(
                                            //             color: AppColor.primary,
                                            //             width: 1,
                                            //           ),
                                            //         ),
                                            //     errorBorder: OutlineInputBorder(
                                            //           borderRadius: BorderRadius.circular(10.r),
                                            //           borderSide: const BorderSide(
                                            //             color: Colors.red,
                                            //             width: 1,
                                            //           ),
                                            //         ),
                                            //   ),
                                            //   onTap: () {
                                            //     _showDatePicker(context);
                                            //   },
                                            // ),

                                            CustomTextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "please select date";
                                                }
                                                return null;
                                              },
                                              controller: _testDateControllers,
                                              labelText: getLocalized(context, "date"),
                                              labelStyle: KtxtStyle().text16DarkBlackw700,
                                              hintText: getLocalized(context, "enter_your_date"),
                                              onTap: () async {
                                                DateTime? pickedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2023),
                                                  lastDate: DateTime.now(),
                                                );
                                                if (pickedDate != null) {
                                                  // Check if the selected date is a Tuesday or Friday
                                                  if (pickedDate.weekday == DateTime.tuesday || pickedDate.weekday == DateTime.friday) {
                                                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                                    _testDateControllers.text = formattedDate;
                                                    print(_testDateControllers.text);
                                                  } else {
                                                    // Show a message if the date is not valid
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(content: Text(getLocalized(context, "select_only_day"))),
                                                    );
                                                  }
                                                }
                                              },
                                              readOnly: true,
                                              suffix: const Icon(Icons.calendar_month),
                                            ),

                                            // CustomTextFormField(
                                            //   validator: (value) {
                                            //     if (value!.isEmpty) {
                                            //       return "please select date";
                                            //     }
                                            //     return null;
                                            //   },
                                            //   controller: _testDateControllers,
                                            //   labelText: getLocalized(context, "date"),
                                            //   labelStyle: KtxtStyle().text16DarkBlackw700,
                                            //   hintText: getLocalized(context, "enter_your_date"),
                                            //   onTap: () async {
                                            //     DateTime? pickedDate = await showDatePicker(
                                            //       context: context,
                                            //       initialDate: DateTime.now(),
                                            //       firstDate: DateTime(2023),
                                            //       lastDate: DateTime(2050),
                                            //     );
                                            //     if (pickedDate != null) {
                                            //       String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                            //       _testDateControllers.text = formattedDate;
                                            //     }
                                            //   },
                                            //   readOnly: true,
                                            //   suffix: const Icon(Icons.calendar_month),
                                            // ),

                                            SizedBox(height: 10.h),
                                            CustomTextFormField(
                                              // validator: (value) {
                                              //   if (value!.isEmpty) {
                                              //     return "please Ecnter weight";
                                              //   }
                                              //   return null;
                                              // },
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(3)
                                              ],
                                              readOnly: notCompletedCheckups[index]["isCompleted"],
                                              controller: _weightControllers,
                                              labelText: getLocalized(context, "weight"),
                                              hintText: getLocalized(context, "enter_your_weight"),
                                              textInputType: TextInputType.number,
                                            ),
                                            SizedBox(height: 10.h),
                                            CustomTextFormField(
                                              // validator: (value) {
                                              //   if (value!.isEmpty) {
                                              //     return "please Enter blood pressure";
                                              //   }
                                              //   return null;
                                              // },
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(10)
                                              ],
                                              readOnly: notCompletedCheckups[index]["isCompleted"],
                                              controller: _bloodPressureControllers,
                                              labelText: getLocalized(context, "blood_pressure"),
                                              hintText: getLocalized(context, "enter_your_blood_pressure"),
                                            ),
                                            SizedBox(height: 10.h),
                                            CustomTextFormField(
                                              // validator: (value) {
                                              //   if (value!.isEmpty) {
                                              //     return "please Ecnter hemoglobin";
                                              //   }
                                              //   return null;
                                              // },
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(5)
                                              ],
                                              textInputType: TextInputType.phone,
                                              readOnly: notCompletedCheckups[index]["isCompleted"],
                                              controller: _hemoGlobinControllers,
                                              labelText: getLocalized(context, "hemoglobin"),
                                              hintText: getLocalized(context, "enter_your_hemoglobin"),
                                            ),
                                            SizedBox(height: 10.h),
                                            Mutation(
                                              options: MutationOptions(
                                                document: gql(Operations.updateAncCheckup),
                                                onCompleted: (data) {
                                                  if (data != null) {
                                                    print(data);
                                                    showSuccessToast(toast,
                                                        "${notCompletedCheckups[index]["weekNumber"].toString()} A.N.C Checkup done");
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AncCheckupInformationScreen(),
                                                      ),
                                                    );
                                                  }
                                                },
                                                onError: (error) {
                                                  showErrorToast(toast, error!.graphqlErrors[0].message);
                                                },
                                              ),
                                              builder: (runMutation, result) {
                                                return result!.isLoading
                                                    ? CustomLoader()
                                                    : notCompletedCheckups[index]["isCompleted"]
                                                        ? Container()
                                                        : CustomElevatedButton(
                                                            buttonStyle: ElevatedButton.styleFrom(
                                                                backgroundColor: notCompletedCheckups[index]["isCompleted"]
                                                                    ? AppColor.blue.withOpacity(0.1)
                                                                    : AppColor.blue),
                                                            onTap: () {
                                                              if (formKeys.currentState!.validate()) {
                                                                runMutation({
                                                                  "maternityId": notCompletedCheckups[index]["maternityId"],
                                                                  "weekNumber": notCompletedCheckups[index]["weekNumber"],
                                                                  "formData": {
                                                                    "maternityId": notCompletedCheckups[index]["maternityId"],
                                                                    "isCompleted": true,
                                                                    "id": notCompletedCheckups[index]["id"],
                                                                    "hemoGlobin": _hemoGlobinControllers.text,
                                                                    "bloodPressure": _bloodPressureControllers.text,
                                                                    "testDate": _testDateControllers.text,
                                                                    "weight": _weightControllers.text
                                                                  }
                                                                });
                                                              }
                                                            },
                                                            text: Text(
                                                              getLocalized(context, "done"),
                                                              style: KtxtStyle().text20Primary600,
                                                            ));
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).toList()),
                              isExpanded: true,
                              // isExpanded: isNotCompletedExpanded,
                            ),
                            ExpansionPanel(
                              backgroundColor: AppColor.secondary,
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      isCompletedExpanded = !isCompletedExpanded;
                                    });
                                  },
                                  title: Text(
                                    "Completed Checkups",
                                    style: KtxtStyle().text16DarkWhitew600,
                                  ),
                                );
                              },
                              body: Column(
                                children: List.generate(
                                  completedCheckups.length,
                                  (index) {
                                    return Card(
                                      elevation: 3,
                                      surfaceTintColor: const Color(0xFFF0F0F0),
                                      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                                        child: Column(
                                          children: [
                                            Text(getLocalized(context, "${completedCheckups[index]["weekNumber"].toString()} ए.एन.सी. चेकअप"),
                                              style: KtxtStyle().text20DarkBlackw700),
                                            CustomListTileWidget(
                                              title: "date",
                                              value: TimeFormateMethod().getTimeFormate(formate: "yyyy-MM-dd", time: completedCheckups[index]['testDate']),
                                            ),
                                            CustomListTileWidget(
                                              title: "weight",
                                              value: completedCheckups[index]['weight'],
                                            ),
                                            CustomListTileWidget(
                                              title: "blood_pressure",
                                              value: completedCheckups[index]['bloodPressure'] ?? "",
                                            ),
                                            CustomListTileWidget(
                                              title: "hemoglobin",
                                              value: completedCheckups[index]['hemoGlobin'] ?? "",
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                              isExpanded: true,
                              // isExpanded: isCompletedExpanded,
                            ),
                          ],
                          expansionCallback: (panelIndex, isExpanded) {
                            setState(() {
                              if (panelIndex == 0) {
                                isNotCompletedExpanded = !isNotCompletedExpanded;
                              } else if (panelIndex == 1) {
                                isCompletedExpanded = !isCompletedExpanded;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
  void _showDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: SizedBox(
              height: 400,
              child: DayPicker.single(
                selectedDate: _selectedDate ?? DateTime.now(),
                onChanged: (date) {
                  if (date.weekday != DateTime.monday &&
                      date.weekday != DateTime.wednesday &&
                      date.weekday != DateTime.thursday &&
                      date.weekday != DateTime.saturday &&
                      date.weekday != DateTime.sunday
                  ) {
                    setState(() {
                      _selectedDate = date;
                      _controller.text = "${date.toLocal()}".split(' ')[0]; // Format date
                    });
                    Navigator.pop(context);
                  }
                },
                firstDate: DateTime.now(),
                lastDate: DateTime(2025),
                // Disable weekends
                selectableDayPredicate: (date) {
                  return date.weekday != DateTime.monday &&
                      date.weekday != DateTime.wednesday &&
                      date.weekday != DateTime.thursday &&
                      date.weekday != DateTime.saturday &&
                      date.weekday != DateTime.sunday;
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomListTileWidget extends StatelessWidget {
  String title;
  String value;
  CustomListTileWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          getLocalized(context, title),
          style: KtxtStyle().text16DarkBlackw700,
        )),
        Text(
          ":",
          style: KtxtStyle().text16DarkBlackw700,
        ),
        Expanded(
            child: Container(
          alignment: Alignment.bottomRight,
          child: Text(
            value,
            style: KtxtStyle().text16DarkBlackw700,
          ),
        )),
      ],
    );
  }
}


// ListView.builder(
//                       itemCount: healthData.length,
//                       itemBuilder: (context, index) {
//                         return healthData[index]['isCompleted']
//                             ? Container()
//                             : Card(
//                                 surfaceTintColor: const Color(0xFFF0F0F0),
//                                 margin: EdgeInsets.symmetric(
//                                     horizontal: 25.w, vertical: 10),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 15.w, vertical: 10.h),
//                                   child: Form(
//                                     key: formKeys[index],
//                                     child: Column(
//                                       children: [
//                                         Text(
//                                           getLocalized(context,
//                                               "${healthData[index]["weekNumber"].toString()} ए.एन.सी. चेकअप"),
//                                           style:
//                                               KtxtStyle().text20DarkBlackw700,
//                                         ),
//                                         CustomTextFormField(
//                                           validator: (value) {
//                                             if (value!.isEmpty) {
//                                               return "please select date";
//                                             }
//                                             return null;
//                                           },
//                                           controller:
//                                               _testDateControllers[index],
//                                           labelText:
//                                               getLocalized(context, "date"),
//                                           labelStyle:
//                                               KtxtStyle().text16DarkBlackw700,
//                                           hintText: getLocalized(
//                                               context, "enter_your_date"),
//                                           onTap: healthData[index]
//                                                   ["isCompleted"]
//                                               ? () {}
//                                               : () async {
//                                                   DateTime? pickedDate =
//                                                       await showDatePicker(
//                                                     context: context,
//                                                     initialDate: DateTime.now(),
//                                                     firstDate: DateTime(2023),
//                                                     lastDate: DateTime(2050),
//                                                   );
//                                                   if (pickedDate != null) {
//                                                     String formattedDate =
//                                                         DateFormat('yyyy-MM-dd')
//                                                             .format(pickedDate);

//                                                     _testDateControllers[index]
//                                                         .text = formattedDate;
//                                                   }
//                                                 },
//                                           readOnly: true,
//                                           suffix:
//                                               const Icon(Icons.calendar_month),
//                                         ),
//                                         SizedBox(
//                                           height: 10.h,
//                                         ),
//                                         CustomTextFormField(
//                                           validator: (value) {
//                                             if (value!.isEmpty) {
//                                               return "please Ecnter weight";
//                                             }
//                                           },
//                                           readOnly: healthData[index]
//                                               ["isCompleted"],
//                                           controller: _weightControllers[index],
//                                           labelText:
//                                               getLocalized(context, "weight"),
//                                           hintText: getLocalized(
//                                               context, "enter_your_weight"),
//                                         ),
//                                         SizedBox(
//                                           height: 10.h,
//                                         ),
//                                         CustomTextFormField(
//                                           validator: (value) {
//                                             if (value!.isEmpty) {
//                                               return "please Ecnter blood pressure";
//                                             }
//                                           },
//                                           readOnly: healthData[index]
//                                               ["isCompleted"],
//                                           controller:
//                                               _bloodPressureControllers[index],
//                                           labelText: getLocalized(
//                                               context, "blood_pressure"),
//                                           hintText: getLocalized(context,
//                                               "enter_your_blood_pressure"),
//                                         ),
//                                         SizedBox(
//                                           height: 10.h,
//                                         ),
//                                         CustomTextFormField(
//                                           validator: (value) {
//                                             if (value!.isEmpty) {
//                                               return "please Ecnter hemoglobin";
//                                             }
//                                           },
//                                           readOnly: healthData[index]
//                                               ["isCompleted"],
//                                           controller:
//                                               _hemoGlobinControllers[index],
//                                           labelText: getLocalized(
//                                               context, "hemoglobin"),
//                                           hintText: getLocalized( []
//                                               context, "enter_your_hemoglobin"),
//                                         ),
//                                         SizedBox(
//                                           height: 10.h,
//                                         ),
//                                         Mutation(
//                                           options: MutationOptions(
//                                             document: gql(updateAncCheckup),
//                                             onCompleted: (data) {
//                                               if (data != null) {
//                                                 print(data);
//                                                 showSuccessToast(toast,
//                                                     "${healthData[index]["weekNumber"].toString()} A.N.C Checkup done");
//                                               }
//                                             },
//                                             onError: (error) {
//                                               showErrorToast(
//                                                   toast,
//                                                   error!.graphqlErrors[0]
//                                                       .message);
//                                             },
//                                           ),
//                                           builder: (runMutation, result) {
//                                             return result!.isLoading
//                                                 ? CustomLoader()
//                                                 : healthData[index]
//                                                         ["isCompleted"]
//                                                     ? Container()
//                                                     : CustomElevatedButton(
//                                                         buttonStyle: ElevatedButton.styleFrom(
//                                                             backgroundColor: healthData[
//                                                                         index][
//                                                                     "isCompleted"]
//                                                                 ? AppColor.blue
//                                                                     .withOpacity(
//                                                                         0.1)
//                                                                 : AppColor
//                                                                     .blue),
//                                                         onTap: () {
//                                                           if (formKeys[index]
//                                                               .currentState!
//                                                               .validate()) {
//                                                             runMutation({
//                                                               "maternityId":
//                                                                   healthData[
//                                                                           index]
//                                                                       [
//                                                                       "maternityId"],
//                                                               "weekNumber":
//                                                                   healthData[
//                                                                           index]
//                                                                       [
//                                                                       "weekNumber"],
//                                                               "formData": {
//                                                                 "maternityId":
//                                                                     healthData[
//                                                                             index]
//                                                                         [
//                                                                         "maternityId"],
//                                                                 "isCompleted":
//                                                                     true,
//                                                                 "id": healthData[
//                                                                         index]
//                                                                     ["id"],
//                                                                 "hemoGlobin":
//                                                                     _hemoGlobinControllers[
//                                                                             index]
//                                                                         .text,
//                                                                 "bloodPressure":
//                                                                     _bloodPressureControllers[
//                                                                             index]
//                                                                         .text,
//                                                                 "testDate":
//                                                                     _testDateControllers[
//                                                                             index]
//                                                                         .text,
//                                                                 "weight":
//                                                                     _weightControllers[
//                                                                             index]
//                                                                         .text
//                                                               }
//                                                             });
//                                                           }
//                                                         },
//                                                         text: Text(
//                                                           getLocalized(
//                                                               context, "done"),
//                                                           style: KtxtStyle()
//                                                               .text20Primary600,
//                                                         ));
//                                           },
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                       },
//                     )
