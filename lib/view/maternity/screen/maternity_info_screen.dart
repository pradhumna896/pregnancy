import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/core/error_handler.dart';
import 'package:pragnancy_app/data/operations.dart';
import 'package:pragnancy_app/utils/time_formate_methode.dart';
import 'package:pragnancy_app/view/maternity/model/maternity_model.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';
import '../../../comman/routes/routes.dart';
import '../../auth/screen/newProfile.dart';
import '../../settings/screen/settings_screen.dart';

// ignore: must_be_immutable
class MaternityInfoScreen extends StatelessWidget {
  const MaternityInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopBarWidget(title: "maternity_information"),
            Query(
              options: QueryOptions(
                document: gql(Operations.maternity),
                variables: {
                  "findMaternityByIdId": int.parse(SessionManager.getMaternityId().toString())
                },
                onError: (error) {
                  print(error!.graphqlErrors[0].message);
                  if (error.graphqlErrors[0].message == "Unauthorized") {
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
                MaternityModel data = MaternityModel.fromJson(result.data!["findMaternityById"]);
                print(data);
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabelText(
                          labelText: getLocalized(context, "name"),
                          labelValue: data.name),
                      const Divider(),
                      _buildLabelText(
                          labelText: getLocalized(context, "age"),
                          labelValue: data.age.toString()),
                      const Divider(),
                      _buildLabelText(
                          labelText: getLocalized(context, "last_menstrual_date"),
                          labelValue: TimeFormateMethod().getTimeFormate(
                              time: data.lastMenstrualDate.toString())),
                      const Divider(),
                      _buildLabelText(
                          labelText: getLocalized(context, "bmi"),
                          labelValue: data.bmi),
                      const Divider(),
                      _buildLabelText(
                          labelText: getLocalized(context, "expected_date_of_delivery"),
                          labelValue: TimeFormateMethod().getTimeFormate(
                              time: data.expectedDateOfDelivery.toString())),
                      const Divider(),
                      _buildLabelText(
                          labelText: getLocalized(context, "high_risk"),
                          labelValue: "-"),
                      ...data.highRisks.map((highRisk) => _buildHighRiskText(highRisk,context)).toList(),
                      const Divider(),
                    ],
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  Text(getLocalized(context, "for_correction_of_error"),
                    style: KtxtStyle().text18Grey600,
                  ),
                  SizedBox(height: 60.h),
                  CustomElevatedButton(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => NewRegistation(
                          title: "edit_profile",)));
                    },
                      text: Row(
                        children: [
                          Icon(Icons.edit,color: Colors.white,size: 16),
                          SizedBox(width: 20.0),
                          Text(getLocalized(context, "click_here"),
                    style: KtxtStyle().text18White700,
                  ),
                        ],
                      )
                  ),
                  SizedBox(height: 20.h,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildHighRiskText(HighRiskModel highRisk, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        highRisk.severeAnemia == true ?
        Text(getLocalized(context, "severe_anemia"),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600,color: Colors.black)) : SizedBox(),
        highRisk.gestationalDiabetes == true ?
        Text(getLocalized(context, "gestational_diabetes"),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600,color: Colors.black)) : SizedBox(),
        highRisk.highBloodPressure == true ?
        Text(getLocalized(context, "pregnancy_induced_hypertension"),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600,color: Colors.black)) : SizedBox(),
        highRisk.priorCaesareanOperation == true ?
        Text(getLocalized(context, "prior_cesarean_operation"),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600,color: Colors.black)) : SizedBox(),
        highRisk.teenagePregnancy == true ?
        Text(getLocalized(context, "teenage_pregnancy"),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600,color: Colors.black)) : SizedBox(),
      ],
    );
  }

  Container _buildLabelText(
      {required String labelText, required String labelValue}) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Text(
        "$labelText : $labelValue",
        style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black),
      ),
    );
  }
}
