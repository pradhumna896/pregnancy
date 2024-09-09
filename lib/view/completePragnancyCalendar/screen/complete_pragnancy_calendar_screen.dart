import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pragnancy_app/core/error_handler.dart';
import 'package:pragnancy_app/utils/string_capitalization.dart';
import 'package:pragnancy_app/utils/time_formate_methode.dart';
import 'package:pragnancy_app/view/completePragnancyCalendar/model/all_calender_model.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
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
    checkup
    note
    description
    testDate
    createdAt
    updatedAt
  }
}
''';


  Future<void> sharePdf() async {
  // Load the PDF file from assets
  final ByteData bytes = await rootBundle.load('asset/sr23_016.pdf');

  // Get the temporary directory
  final String dir = (await getTemporaryDirectory()).path;

  // Create a new file in the temporary directory
  final File file = File('$dir/sr23_016.pdf');

  // Write the PDF file data to the temporary file
  await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);

  // Convert File to XFile
  final XFile xfile = XFile(file.path);

  // Share the file using share_plus
  await Share.shareXFiles([xfile], text: 'Here is your PDF file');
}
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildLabelText(
                                labelText: getLocalized(context, "age"),
                                labelValue: "25"),
                            _buildLabelText(
                                labelText: getLocalized(
                                    context, "last_menstrual_date"),
                                labelValue: "15/07/2024"),
                            _buildLabelText(
                                labelText: getLocalized(context, "bmi"),
                                labelValue: "20.17"),
                            _buildLabelText(
                                labelText: getLocalized(
                                    context, "expected_date_of_delivery"),
                                labelValue: "10/10/2000"),
                            SizedBox(height: 20.h),
                          ],
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
                              image:AssetImage("asset/images/User image (1).png"),
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
            SizedBox(
              height: 20.h,
            ),
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
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        padding: EdgeInsets.all(20.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffD6D0D0),
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 11,
                                offset: Offset(4, 4),
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].checkup ?? "",
                              style: KtxtStyle().text17Blackw500,
                            ),
                            Text(
                              data[index].note ?? "",
                              style: KtxtStyle().text17Blackw500,
                            ),
                            Text(
                              data[index].description ?? "",
                              style: KtxtStyle().text17Blackw500,
                            ),
                            Text(
                              TimeFormateMethod().getTimeFormate(
                                  formate: "EEEE-dd/MM/yyyy",
                                  time: data[index].testDate.toString()),
                              style: KtxtStyle().text17Blackw500,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20.h);
                    },
                    itemCount: data.length);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {
                    sharePdf();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getLocalized(
                        context,
                        "complete_pragnancy_calender_for_whatsapp",
                      ),
                      textAlign: TextAlign.center,
                      style: KtxtStyle().text17Whitew700,
                    ),
                  )),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }

   _buildLabelText(
      {required String labelText, required String labelValue}) {
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
