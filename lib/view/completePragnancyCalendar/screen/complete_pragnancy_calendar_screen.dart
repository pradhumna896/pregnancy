import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pragnancy_app/core/error_handler.dart';
import 'package:pragnancy_app/data/env.dart';
import 'package:pragnancy_app/utils/string_capitalization.dart';
import 'package:pragnancy_app/utils/time_formate_methode.dart';
import 'package:pragnancy_app/view/completePragnancyCalendar/model/all_calender_model.dart';
import 'package:pragnancy_app/view/maternity/model/maternity_model.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import '../../../comman/routes/routes.dart';

class CompletePragnancyCalendarScreen extends StatefulWidget {
  const CompletePragnancyCalendarScreen({super.key});

  @override
  State<CompletePragnancyCalendarScreen> createState() =>
      _CompletePragnancyCalendarScreenState();
}

class _CompletePragnancyCalendarScreenState
    extends State<CompletePragnancyCalendarScreen> {
  String allCalender = r'''
query AllCalendar {
  allCalendar {
    id
    weekNumber
    description
    testDate
    createdAt
    updatedAt
  }
}
''';

  var finalDay;

  String maternityById = r'''
query FindMaternityById($findMaternityByIdId: Float!) {
  findMaternityById(id: $findMaternityByIdId) {
    id
    name
    age
    bmi
    pregnancyRisk
    expectedDateOfDelivery
    lastMenstrualDate
    createdAt
    updatedAt
    userId
    highRisks {
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
  }
}''';
  Future<void> downloadAndShareFile(String url) async {
    try {
      // Specify the URL
      // Send the HTTP GET request
      final response = await http.get(Uri.parse(url));
      // Check if the request was successful
      if (response.statusCode == 200) {
        // Get the application's document directory
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/pregnancy_calendar.csv';
        // Write the file to the specified path
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        // Share the file
        await Share.shareFiles([filePath],
            text: 'Here is the pregnancy calendar.');
      } else {
        print('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  DateTime calculateDate(String dateStr, int daysToAdd) {
    // Parse the input date (assumed format: yyyy-MM-dd)
    List<String> parts = dateStr.split('-');
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);

    // Create the initial date
    DateTime initialDate = DateTime(year, month, day);

    // Add the specified number of days
    DateTime newDate = initialDate.add(Duration(days: daysToAdd));

    // Loop to find the next Tuesday (3) or Friday (5)
    while (newDate.weekday != 2 && newDate.weekday != 5) {
      // Increment by one day until it's Tuesday or Friday
      newDate = newDate.add(Duration(days: 1));
    }

    return newDate;
  }

  String formatDate(DateTime date) {
    // Format date as dd-MM-yyyy
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }
  bool isButtonDisabled = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTopBarWidget(title: "complete_pregnancy_calendar"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              height: 280.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 30.h,
                    bottom: 0,
                    child: Card(
                      elevation: 3,
                      surfaceTintColor: AppColor.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Query(
                          options: QueryOptions(
                              document: gql(maternityById),
                              onComplete: (data) {
                                if (data != null) {
                                  print(data);
                                }
                              },
                              variables: {
                                "findMaternityByIdId": int.parse(SessionManager.getMaternityId().toString())
                              }),
                          builder: (result, {fetchMore, refetch}) {
                            if (result.isLoading) {
                              return Center(
                                child: CustomLoader(),
                              );
                            }
                            if (result.hasException) {
                              return Center(
                                child: Text(result.exception.toString()),
                              );
                            }
                            MaternityModel data = MaternityModel.fromJson(result.data!["findMaternityById"]);
                            finalDay = TimeFormateMethod().getTimeFormate(time: data.lastMenstrualDate.toString());
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _buildLabelText(
                                    labelText: getLocalized(context, "age"),
                                    labelValue: data.age.toString() ?? ""),
                                _buildLabelText(
                                    labelText: getLocalized(
                                        context, "last_menstrual_date"),
                                    labelValue: TimeFormateMethod()
                                        .getTimeFormate(
                                            time: data.lastMenstrualDate
                                                .toString())),
                                _buildLabelText(
                                    labelText: getLocalized(context, "bmi"),
                                    labelValue: data.bmi ?? "N/A"),
                                _buildLabelText(
                                    labelText: getLocalized(
                                        context, "expected_date_of_delivery"),
                                    labelValue: TimeFormateMethod()
                                        .getTimeFormate(
                                            time: data.expectedDateOfDelivery
                                                .toString())),
                                SizedBox(height: 20.h),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          height: 70.h,
                          width: 70.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage("asset/images/User image (1).png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          SessionManager.getName().toString().toCapitalized(),
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Query(
              options: QueryOptions(
                document: gql(allCalender),
                onError: (error) {
                  if (error!.graphqlErrors[0].message == "Unauthorized") {
                    authorized(context);
                  }
                },
              ),
              builder: (result, {fetchMore, refetch}) {
                print(result);
                if (result.hasException) {
                  return Text(result.exception!.graphqlErrors[0].message);
                }
                if (result.isLoading) {
                  return const Center(child: CustomLoader());
                }
                List<AllCalendarModel> data = [];
                result.data!["allCalendar"].forEach((element) {
                  data.add(AllCalendarModel.fromJson(element));
                });
                return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {

                      /// calculation date

                      DateTime resultDate = calculateDate(finalDay, data[index].weekNumber!.toInt());
                      String displayDate = formatDate(resultDate);
                      String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                      /// check time before logic
                      DateTime currentDateTime = DateFormat('dd-MM-yyyy').parse(currentDate);
                      DateTime displayDateTime = DateFormat('dd-MM-yyyy').parse(displayDate);
                      bool isBefore = currentDateTime.isBefore(displayDateTime);
                      /// for day like monday friday
                      String dateString = displayDate;
                      DateTime date = DateFormat('dd-MM-yyyy').parse(dateString);
                      String dayOfWeek = DateFormat('EEEE').format(date);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: TestCard(
                            weekNumber: data[index].weekNumber!,
                            testDate: displayDate,
                            // testDate: TimeFormateMethod().getTimeFormate(formate: "EEEE-dd/MM/yyyy",
                            //     time: data[index].testDate.toString()),
                            description: data[index].description!,
                           colorCheck: isBefore == true ? true : false,
                          dayDate: dayOfWeek,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20.h);
                    },
                    itemCount: data.length);
              },
            ),
            SizedBox(height: 20.h),
            Query(
              options: QueryOptions(
                document: gql(r'''query Query {
                        exportDataToCsv
                     }'''),
                onComplete: (data) {
                  if (data != null) {
                    print("pppppp ${data["exportDataToCsv"]}");
                  }
                },
              ),
              builder: (result, {fetchMore, refetch}) {
                if (result.isLoading) {
                  return Center(
                    child: CustomLoader(),
                  );
                }
                if (result.data == null) {
                  return Center(
                    child: Text('No Data Found'),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isButtonDisabled ? Colors.grey : AppColor.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: isButtonDisabled
                        ? null // Disable button if it has already been clicked
                        : () {
                      setState(() {
                        isButtonDisabled = true; // Disable the button after click
                      });

                      downloadAndShareFile(mediaUrl + result.data!["exportDataToCsv"]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        getLocalized(context, "complete_pragnancy_calender_for_whatsapp"),
                        textAlign: TextAlign.center,
                        style: KtxtStyle().text17Whitew700,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }

  _buildLabelText({required String labelText, required String labelValue}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            labelText,
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        Text(":",
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              labelValue,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

class TestCard extends StatelessWidget {
  final int weekNumber;
  final String testDate;
  final String description;
  final bool colorCheck;
  final String dayDate;

  const TestCard({
    Key? key,
    required this.weekNumber,
    required this.testDate,
    required this.description,
    required this.colorCheck,
    required this.dayDate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: colorCheck == true ? Colors.white : Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${getLocalized(context, "day")} : $weekNumber",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("${getLocalized(context, "test_date")} : $testDate - $dayDate",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 16,color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
