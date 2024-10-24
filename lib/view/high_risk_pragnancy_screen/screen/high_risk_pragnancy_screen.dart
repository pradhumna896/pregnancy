import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/core/error_handler.dart';
import 'package:pragnancy_app/utils/custom_toast.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';
import '../../../comman/routes/routes.dart';

class HighRiskPragnancyScreen extends StatefulWidget {
  const HighRiskPragnancyScreen({super.key});

  @override
  State<HighRiskPragnancyScreen> createState() =>
      _HighRiskPragnancyScreenState();
}

class _HighRiskPragnancyScreenState extends State<HighRiskPragnancyScreen> {
  @override
  void initState() {
    toast.init(context);
    super.initState();
  }

  String allRisk = r'''query FindHighRiskById($findHighRiskByIdId: Float!) {
  findHighRiskById(id: $findHighRiskByIdId) {
    id
    severeAnemia
    highBloodPressure
    gestationalDiabetes
    teenagePregnancy
    priorCaesareanOperation
    maternityId
    createdAt
    updatedAt
  }
}''';
  String updateRisk = r'''
mutation UpdateHighRisk($data: UpdateHighRiskDto!) {
  updateHighRisk(data: $data) {
    id
    severeAnemia
    highBloodPressure
    gestationalDiabetes
    teenagePregnancy
    priorCaesareanOperation
    maternityId
    createdAt
    updatedAt
  }
}''';

  bool isLoading = false;

  List tempList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomTopBarWidget(title: "high_risk_pregnancy"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              getLocalized(context, "click_check_box"),
              textAlign: TextAlign.center,
              style: KtxtStyle().text20DarkBlackw700,
            ),
          ),
          SizedBox(height: 20.h),
          Query(
            options: QueryOptions(
              document: gql(allRisk),
              variables: {
                "findHighRiskByIdId": int.parse(SessionManager.getMaternityId().toString())
              },
              onComplete: (data) {
                print(data);
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
              return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Mutation(
                          options: MutationOptions(
                            document: gql(updateRisk),
                            onCompleted: (data) {
                              if (data != null) {
                                print(data);
                                showSuccessToast(toast, "Save data",);
                              }
                            },
                          ),
                          builder: (runMutation, check) {
                            if (check!.isLoading) {
                              return CustomLoader();
                            }
                            return CustomCheckbox(
                                value: result.data!["findHighRiskById"]["severeAnemia"],
                                onChanged: (p0) {
                                  runMutation({
                                    "data": {
                                      "teenagePregnancy": result.data!["findHighRiskById"]["teenagePregnancy"],
                                      "severeAnemia": !result.data!["findHighRiskById"]["severeAnemia"],
                                      "priorCaesareanOperation": result.data!["findHighRiskById"]["priorCaesareanOperation"],
                                      "maternityId": result.data!["findHighRiskById"]["maternityId"],
                                      "id": result.data!["findHighRiskById"]["id"],
                                      "highBloodPressure": result.data!["findHighRiskById"]["highBloodPressure"],
                                      "gestationalDiabetes": result.data!["findHighRiskById"]["gestationalDiabetes"]
                                    }
                                  });
                                },
                                title: getLocalized(context, "severe_anemia"));
                          },
                        ),
                        Mutation(
                          options: MutationOptions(
                            document: gql(updateRisk),
                            onCompleted: (data) {
                              if (data != null) {
                                print(data);
                                showSuccessToast(toast, "Save data");
                              }
                            },
                          ),
                          builder: (runMutation, check) {
                            if (check!.isLoading) {
                              return CustomLoader();
                            }
                            return CustomCheckbox(
                                value: result.data!["findHighRiskById"]
                                ["highBloodPressure"],
                                onChanged: (p0) {
                                  runMutation({
                                    "data": {
                                      "teenagePregnancy":
                                      result.data!["findHighRiskById"]
                                      ["teenagePregnancy"],
                                      "severeAnemia":
                                      result.data!["findHighRiskById"]
                                      ["severeAnemia"],
                                      "priorCaesareanOperation":
                                      result.data!["findHighRiskById"]
                                      ["priorCaesareanOperation"],
                                      "maternityId": result
                                          .data!["findHighRiskById"]["maternityId"],
                                      "id": result.data!["findHighRiskById"]["id"],
                                      "highBloodPressure":
                                      !result.data!["findHighRiskById"]
                                      ["highBloodPressure"],
                                      "gestationalDiabetes":
                                      result.data!["findHighRiskById"]
                                      ["gestationalDiabetes"]
                                    }
                                  });
                                },
                                title: getLocalized(
                                    context, "pregnancy_induced_hypertension"));
                          },
                        ),
                        Mutation(
                          options: MutationOptions(
                            document: gql(updateRisk),
                            onCompleted: (data) {
                              if (data != null) {
                                print(data);
                                showSuccessToast(toast, "Save data");
                              }
                            },
                          ),
                          builder: (runMutation, check) {
                            if (check!.isLoading) {
                              return CustomLoader();
                            }
                            return CustomCheckbox(
                                value: result.data!["findHighRiskById"]["gestationalDiabetes"],
                                onChanged: (p0) {
                                  runMutation({
                                    "data": {
                                      "teenagePregnancy": result.data!["findHighRiskById"]["teenagePregnancy"],
                                      "severeAnemia":
                                      result.data!["findHighRiskById"]
                                      ["severeAnemia"],
                                      "priorCaesareanOperation":
                                      result.data!["findHighRiskById"]
                                      ["priorCaesareanOperation"],
                                      "maternityId": result
                                          .data!["findHighRiskById"]["maternityId"],
                                      "id": result.data!["findHighRiskById"]["id"],
                                      "highBloodPressure":
                                      result.data!["findHighRiskById"]
                                      ["highBloodPressure"],
                                      "gestationalDiabetes": !result.data!["findHighRiskById"]["gestationalDiabetes"]
                                    }
                                  });
                                },
                                title: getLocalized(context, "gestational_diabetes"));
                          },
                        ),
                        Mutation(
                          options: MutationOptions(
                            document: gql(updateRisk),
                            onCompleted: (data) {
                              if (data != null) {
                                print(data);
                                showSuccessToast(toast, "Save data");
                              }
                            },
                          ),
                          builder: (runMutation, check) {
                            if (check!.isLoading) {
                              return CustomLoader();
                            }
                            return CustomCheckbox(
                                value: result.data!["findHighRiskById"]["teenagePregnancy"],
                                onChanged: (p0) {
                                  runMutation({
                                    "data": {
                                      "teenagePregnancy":
                                      !result.data!["findHighRiskById"]
                                      ["teenagePregnancy"],
                                      "severeAnemia":
                                      result.data!["findHighRiskById"]
                                      ["severeAnemia"],
                                      "priorCaesareanOperation":
                                      result.data!["findHighRiskById"]
                                      ["priorCaesareanOperation"],
                                      "maternityId": result
                                          .data!["findHighRiskById"]["maternityId"],
                                      "id": result.data!["findHighRiskById"]["id"],
                                      "highBloodPressure":
                                      result.data!["findHighRiskById"]
                                      ["highBloodPressure"],
                                      "gestationalDiabetes":
                                      result.data!["findHighRiskById"]
                                      ["gestationalDiabetes"]
                                    }
                                  });
                                },
                                title: getLocalized(context, "teenage_pregnancy"));
                          },
                        ),
                        Mutation(
                          options: MutationOptions(
                            document: gql(updateRisk),
                            onCompleted: (data) {
                              if (data != null) {
                                print(data);
                                showSuccessToast(toast, "Save data");
                              }
                            },
                          ),
                          builder: (runMutation, check) {
                            if (check!.isLoading) {
                              return CustomLoader();
                            }
                            return CustomCheckbox(
                                value: result.data!["findHighRiskById"]
                                ["priorCaesareanOperation"],
                                onChanged: (p0) {
                                  runMutation({
                                    "data": {
                                      "teenagePregnancy":
                                      result.data!["findHighRiskById"]
                                      ["teenagePregnancy"],
                                      "severeAnemia":
                                      result.data!["findHighRiskById"]
                                      ["severeAnemia"],
                                      "priorCaesareanOperation":
                                      !result.data!["findHighRiskById"]
                                      ["priorCaesareanOperation"],
                                      "maternityId": result
                                          .data!["findHighRiskById"]["maternityId"],
                                      "id": result.data!["findHighRiskById"]["id"],
                                      "highBloodPressure":
                                      result.data!["findHighRiskById"]
                                      ["highBloodPressure"],
                                      "gestationalDiabetes":
                                      result.data!["findHighRiskById"]
                                      ["gestationalDiabetes"]
                                    }
                                  });
                                },
                                title: getLocalized(
                                    context, "prior_cesarean_operation"));
                          },
                        ),
                      ],
                    ),
              ));
            },
          )
        ],
      ),
    );
  }

  List highRiskList = [
    "severe_anemia",
    "pregnancy_induced_hypertension",
    "gestational_diabetes",
    "teenage_pregnancy",
    "prior_cesarean_operation"
  ];
}
