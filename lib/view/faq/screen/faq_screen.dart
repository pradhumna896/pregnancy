import '../../../comman/routes/routes.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopBarWidget(title: "FAQ"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We’re here to help you with anything and everyting on Lorem ipsum dolor",
                    style: TextStyle(
                        fontSize: 27.sp,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomTextFormField(
                    hintText: "Search",
                    prefix: Icon(Icons.search),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "FAQ",
                    style: KtxtStyle().text16DarkBlackw700,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildExpansionTile();
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 138.h,
              width: 335.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35.r),
                    bottomRight: Radius.circular(35.r),
                  ),
                  color: AppColor.primary),
              child: Stack(
                children: [
                  Positioned(
                    right: -180.h,
                    bottom: -180.h,
                    child: Container(
                      height: 269.h,
                      width: 269.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffFFF9F9).withOpacity(0.2)),
                    ),
                  ),
                  Positioned(
                    right: 30.h,
                    bottom: 30.h,
                    child: Container(
                      height: 39.h,
                      width: 39.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffFFF9F9).withOpacity(0.2)),
                    ),
                  ),
                  Positioned(
                      left: 20.w,
                      top: 10.h,
                      right: 60,
                      child: Column(
                        children: [
                          Text(
                            "Any question or remarks? Just contact us:",
                            style: KtxtStyle().text14Whitew700,
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }

  Column _buildExpansionTile() {
    return Column(
      children: [
        ExpansionTile(
          trailing: const Icon(Icons.add),
          title: Text(
            "How to apply for a Lorem ipsum dolor?",
            style: KtxtStyle().text16DarkBlackw600,
          ),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Provides financial assistance of ₹5,000 in three installments to pregnant and lactating women for the first live birth. The scheme aims to compensate for wage loss and improve the health of mother and child.",
                style: KtxtStyle().text16Blackw400,
              ),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
