import 'package:easy_localization/easy_localization.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/comman/routes/routes.dart';
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
  List<TextEditingController> _weightControllers = [];

  List<TextEditingController> _bloodPressureControllers = [];

  List<TextEditingController> _hemoGlobinControllers = [];

  List<TextEditingController> _testDateControllers = [];

  String ancCheckup = r'''
query GetCheckupsByMaternityId($maternityId: Float!) {
  getCheckupsByMaternityId(maternityId: $maternityId) {
    id
    maternityId
    weekNumber
    weight
    bloodPressure
    hemoGlobin
    testDate
    createdAt
    updatedAt
    isCompleted
  }
}
''';

  String updateAncCheckup = r'''
mutation SubmitWeeklyCheckup($maternityId: Float!, $weekNumber: Float!, $formData: UpdateCheckupInformationDto!) {
  submitWeeklyCheckup(maternityId: $maternityId, weekNumber: $weekNumber, formData: $formData) {
    id
    maternityId
    weekNumber
    weight
    bloodPressure
    hemoGlobin
    testDate
    isCompleted
    createdAt
    updatedAt
  }
}''';
  @override
  void initState() {
    toast.init(context);
    super.initState();
  }

  @override
  void dispose() {
    _weightControllers.forEach((controller) => controller.dispose());
    _bloodPressureControllers.forEach((controller) => controller.dispose());
    _hemoGlobinControllers.forEach((controller) => controller.dispose());
    _testDateControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  List<GlobalKey<FormState>> formKeys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomTopBarWidget(title: "anc_checkup"),
          Expanded(
              child: Query(
                  options: QueryOptions(
                    document: gql(ancCheckup),
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
                    final healthData = result.data!['getCheckupsByMaternityId'];
                    _weightControllers = List.generate(
                        healthData.length,
                        (index) => TextEditingController(
                            text: healthData[index]['weight'].toString()));
                    _bloodPressureControllers = List.generate(
                        healthData.length,
                        (index) => TextEditingController(
                            text: healthData[index]['bloodPressure'] ?? ""));
                    _hemoGlobinControllers = List.generate(
                        healthData.length,
                        (index) => TextEditingController(
                            text: healthData[index]['hemoGlobin'] ?? ""));
                    _testDateControllers = List.generate(
                        healthData.length,
                        (index) => TextEditingController(
                            text: healthData[index]['testDate'] != null
                                ? TimeFormateMethod().getTimeFormate(
                                    formate: "yyyy-MM-dd",
                                    time: healthData[index]['testDate']
                                        .toString())
                                : ""));
                    formKeys = List.generate(
                      healthData.length,
                      (index) => GlobalKey<FormState>(),
                    );
                    return ListView.builder(
                      itemCount: healthData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          surfaceTintColor: const Color(0xFFF0F0F0),
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 10),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            child: Form(
                              key: formKeys[index],
                              child: Column(
                                children: [
                                  Text(
                                    getLocalized(context,
                                        "${healthData[index]["weekNumber"].toString()} ए.एन.सी. चेकअप"),
                                    style: KtxtStyle().text20DarkBlackw700,
                                  ),
                                  CustomTextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please select date";
                                      }
                                      return null;
                                    },
                                    controller: _testDateControllers[index],
                                    labelText: getLocalized(context, "date"),
                                    labelStyle: KtxtStyle().text16DarkBlackw700,
                                    hintText: getLocalized(
                                        context, "enter_your_date"),
                                    onTap: healthData[index]["isCompleted"]
                                        ? () {}
                                        : () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2023),
                                              lastDate: DateTime(2050),
                                            );
                                            if (pickedDate != null) {
                                              String formattedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);

                                              _testDateControllers[index].text =
                                                  formattedDate;
                                            }
                                          },
                                    readOnly: true,
                                    suffix: const Icon(Icons.calendar_month),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please Ecnter weight";
                                      }
                                    },
                                    readOnly: healthData[index]["isCompleted"],
                                    controller: _weightControllers[index],
                                    labelText: getLocalized(context, "weight"),
                                    hintText: getLocalized(
                                        context, "enter_your_weight"),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please Ecnter blood pressure";
                                      }
                                    },
                                    readOnly: healthData[index]["isCompleted"],
                                    controller:
                                        _bloodPressureControllers[index],
                                    labelText:
                                        getLocalized(context, "blood_pressure"),
                                    hintText: getLocalized(
                                        context, "enter_your_blood_pressure"),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please Ecnter hemoglobin";
                                      }
                                    },
                                    readOnly: healthData[index]["isCompleted"],
                                    controller: _hemoGlobinControllers[index],
                                    labelText:
                                        getLocalized(context, "hemoglobin"),
                                    hintText: getLocalized(
                                        context, "enter_your_hemoglobin"),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Mutation(
                                    options: MutationOptions(
                                      document: gql(updateAncCheckup),
                                      onCompleted: (data) {
                                        if (data != null) {
                                          print(data);
                                          showSuccessToast(toast,
                                              "${healthData[index]["weekNumber"].toString()} A.N.C Checkup done");
                                        }
                                      },
                                      onError: (error) {
                                        showErrorToast(toast,
                                            error!.graphqlErrors[0].message);
                                      },
                                    ),
                                    builder: (runMutation, result) {
                                      return result!.isLoading
                                          ? CustomLoader()
                                          : healthData[index]["isCompleted"]
                                              ? Container()
                                              : CustomElevatedButton(
                                                  buttonStyle:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor: healthData[
                                                                      index][
                                                                  "isCompleted"]
                                                              ? AppColor.blue
                                                                  .withOpacity(
                                                                      0.1)
                                                              : AppColor.blue),
                                                  onTap: () {
                                                    if (formKeys[index]
                                                        .currentState!
                                                        .validate()) {
                                                      runMutation({
                                                        "maternityId":
                                                            healthData[index]
                                                                ["maternityId"],
                                                        "weekNumber":
                                                            healthData[index]
                                                                ["weekNumber"],
                                                        "formData": {
                                                          "maternityId":
                                                              healthData[index][
                                                                  "maternityId"],
                                                          "isCompleted": true,
                                                          "id":
                                                              healthData[index]
                                                                  ["id"],
                                                          "hemoGlobin":
                                                              _hemoGlobinControllers[
                                                                      index]
                                                                  .text,
                                                          "bloodPressure":
                                                              _bloodPressureControllers[
                                                                      index]
                                                                  .text,
                                                          "testDate":
                                                              _testDateControllers[
                                                                      index]
                                                                  .text,
                                                          "weight":
                                                              _weightControllers[
                                                                      index]
                                                                  .text
                                                        }
                                                      });
                                                    }
                                                  },
                                                  text: Text(
                                                    getLocalized(
                                                        context, "done"),
                                                    style: KtxtStyle()
                                                        .text20Primary600,
                                                  ));
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
