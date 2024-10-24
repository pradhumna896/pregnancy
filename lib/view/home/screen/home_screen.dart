import 'package:pragnancy_app/theme/app_gradient.dart';
import 'package:pragnancy_app/view/anc_checkup_information/screen/anc_checkup_information_screen.dart';
import 'package:pragnancy_app/view/completePragnancyCalendar/screen/complete_pragnancy_calendar_screen.dart';
import 'package:pragnancy_app/view/high_risk_pragnancy_screen/screen/high_risk_pragnancy_screen.dart';
import 'package:pragnancy_app/view/home/usha/pages/patients_screen.dart';
import 'package:pragnancy_app/view/maternity/screen/maternity_info_screen.dart';
import 'package:pragnancy_app/view/schemeForPragnantWomens/screen/schem_for_pragnant_women.dart';
import 'package:pragnancy_app/view/settings/screen/settings_screen.dart';
import '../../../comman/routes/routes.dart';
import '../../settings/screen/addedPregnancyWomen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBarWidget(
            title: 'home',
            icon: Icons.menu,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ));
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: SessionManager.getUserType() == "usha"
                    ? patientList.length
                    : cardList.length,
                itemBuilder: (context, index) {
                  return CustomCardWidget(
                    title: SessionManager.getUserType() == "usha"
                        ? patientList[index].title
                        : cardList[index].title,
                    gradient: cardList[index].gradient,
                    image:SessionManager.getUserType() == "usha"
                        ? patientList[index].imagePath
                        : cardList[index].imagePath,
                    page: SessionManager.getUserType() == "usha"
                        ? patientList[index].page
                        : cardList[index].page,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  List<CardModel> patientList = [
    CardModel(
      title: "Patient",
      imagePath: "asset/images/highRisk.png",
      gradient: AppGradient().highRiskPragnancyGradient,
      page: PatientsScreen(),
    ),
  ];

  List<CardModel> cardList = [
    CardModel(
      title: "maternity_information",
      imagePath: "asset/images/materine_information.png",
      gradient: AppGradient().maternityGradient,
      page: MaternityInfoScreen(),
    ),
    CardModel(
      title: "complete_pregnancy_calendar",
      imagePath: "asset/images/pragnency_calender.png",
      gradient: AppGradient().pragnancyGradient,
      page: const CompletePragnancyCalendarScreen(),
    ),
    CardModel(
      title: "high_risk_pregnancy",
      imagePath: "asset/images/highRisk.png",
      gradient: AppGradient().highRiskPragnancyGradient,
      page: HighRiskPragnancyScreen(),
    ),
    CardModel(
      title: "anc_checkup",
      imagePath: "asset/images/anc_checkup.png",
      gradient: AppGradient().ancCheckupGradient,
      page: AncCheckupInformationScreen(),
    ),
    CardModel(
      title: "pregnancy_woman_details",
      imagePath: "asset/images/highRisk.png",
      gradient: AppGradient().schemeGradient,
      page: Addedpregnancywomen(),
    ),
    CardModel(
      title: "schemes_for_pregnant_women",
      imagePath: "asset/images/scheme_for_pragnent.png",
      gradient: AppGradient().ancCheckupGradient,
      page: SchemForPragnantWomen(),
    ),
  ];
}

class CustomTopBarWidget extends StatelessWidget {
  final String title;
  final void Function()? onPress;
  final IconData? icon;
  const CustomTopBarWidget(
      {super.key, required this.title, this.onPress, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      height: 260.h,
      child: Stack(
        children: [
          Container(
            height: 260.h,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffCC6E90),
                    Color(0xffBE1653),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28.r),
                  bottomRight: Radius.circular(28.r),
                )),
          ),
          Positioned(
              right: -10.w,
              top: 40.h,
              bottom: 0,
              child: Image.asset("asset/images/logo.png")),
          Positioned(
            top: 60.h,
            left: 20.w,
            child: Container(
              height: 44.h,
              width: 44.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.white),
              child: Center(
                  child: IconButton(
                onPressed: onPress ??
                    () {
                      Navigator.pop(context);
                    },
                icon: Icon(
                  icon ?? Icons.arrow_back_ios,
                  size: 14.sp,
                ),
              )),
            ),
          ),
          Positioned(
            top: 150.h,
            left: 20.w,
            right: MediaQuery.sizeOf(context).width / 2.5,
            child: Text(
              getLocalized(context, title),
              style: KtxtStyle().text24Primary600,
            ),
          ),
        ],
      ),
    );
  }
}

class CardModel {
  String title;
  Gradient gradient;
  String imagePath;
  Widget page;
  CardModel(
      {required this.title,
      required this.gradient,
      required this.imagePath,
      required this.page});
}

class CustomCardWidget extends StatelessWidget {
  final Gradient gradient;
  final String title;
  final String image;
  final Widget page;
  const CustomCardWidget({
    super.key,
    required this.gradient,
    required this.title,
    required this.image,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          height: 170.h,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: AppColor.grey.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 3.82.r,
                  offset: const Offset(0, 3.82), // changes position of shadow
                ),
              ]),
          child: Stack(
            children: [
              Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                    child: Image.asset(image),
                  )),
              Positioned(
                  left: 18.w,
                  bottom: 22.h,
                  right: 150.w,
                  child: Text(getLocalized(context, title),
                      style: KtxtStyle().text20White700)),
            ],
          )),
    );
  }
}
