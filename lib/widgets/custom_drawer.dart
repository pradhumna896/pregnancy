import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../utils/image_constant.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isUserManagement = false;
  bool isAdmin = false;
  bool isHR = false;
  bool isAssessment = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 180.h,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          ImageConstant.posPicture,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "POS Management",
                      style: CustomTextStyles.titleLargeWhiteA600,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: DrawerListTile(
                press: () {
                  //Get.toNamed(AppRoutes.homeScreen);
                },
                svgSrc: ImageConstant.dashboardIcon,
                title: "Dashboard",
              ),
            ),
            _buildAdminTile(context),
            _buildHrTile(),
            _buildAssessmentTile(context),
            DrawerListTile(
              press: () {},
              svgSrc: ImageConstant.roles,
              title: "Activity Logs",
            ),
          ],
        ),
      ),
    );
  }

  ExpansionTile _buildAdminTile(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 15.w),
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Text("Profitability Reports",
          style: TextStyle(fontSize: 18.sp, color: appTheme.blueGray900)),
      trailing: Icon(
        isAdmin ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
        color: appTheme.blueGray900,
      ),
      leading: Icon(
        Icons.admin_panel_settings,
        color: appTheme.blueGray900,
        size: 30.0,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          isAdmin = expanded;
        });
      },
      children: [
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/roles',
              (route) => false,
            );
          },
          svgSrc: ImageConstant.roles,
          title: "Roles",
        ),

        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/manpower',
              (route) => false,
            );
          },
          svgSrc: ImageConstant.manpower,
          title: "Manpower",
        ),

        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/department',
              (route) => false,
            );
          },
          svgSrc: ImageConstant.departments,
          title: "Departments",
        ),
        // if (containList.contains(permissionList!.readProject!.slug!))
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/project',
              (route) => false,
            );
          },
          svgSrc: ImageConstant.projects,
          title: "Project",
        ),
      ],
    );
  }

  ExpansionTile _buildAssessmentTile(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 15),
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Text("Product Reports",
          style: TextStyle(fontSize: 18.sp, color: appTheme.blueGray900)),
      trailing: Icon(
        isAssessment ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
        color: appTheme.blueGray900,
      ),
      leading: Icon(
        Icons.assessment,
        color: appTheme.blueGray900,
        size: 30.0,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          isAssessment = expanded;
        });
      },
      children: [
        // if (containList.contains(permissionList!.readBoard!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.board,
          title: "Board",
        ),
        // if (containList.contains(permissionList!.readDailyTask!.slug!))
        DrawerListTile(
          press: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/task',
              (route) => false,
            );
          },
          svgSrc: ImageConstant.taskIcon,
          title: "Task",
        ),
        // if (containList.contains(permissionList!.readDailyTask!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.taskIcon,
          title: "Today Task",
        ),
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.taskIcon,
          title: "My Task",
        ),
        DrawerListTile(
          press: () {
            // Get.toNamed(AppRoutes.birthdayCards);
          },
          svgSrc: ImageConstant.birthdayCard,
          title: "Birthday Cards",
        ),
      ],
    );
  }

  ExpansionTile _buildHrTile() {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 15),
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Sales Report",
            style: TextStyle(fontSize: 18.sp, color: appTheme.blueGray900)),
        // Container(
        //   decoration: BoxDecoration(
        //       color: Colors.red,
        //       borderRadius: BorderRadius.circular(5)),
        //   padding: const EdgeInsets.all(5.0),
        //   child: const Text("New",
        //       style: TextStyle(
        //         fontSize: 15,
        //         color: Colors.white,
        //       )),
        // ),
      ]),
      trailing: Icon(
        isHR ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
        color: appTheme.blueGray900,
      ),
      leading: Icon(
        Icons.dvr,
        color: appTheme.blueGray900,
        size: 30.0,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          isHR = expanded;
        });
      },
      children: [
        // if (containList.contains(permissionList!.readDiscipline!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.discipline,
          title: "Discipline",
        ),
        // if (containList.contains(permissionList!.myDiscipline!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.discipline,
          title: "My Discipline",
        ),
        // if (containList.contains(permissionList!.readAttendance!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.attendence,
          title: "Attendence",
        ),
        // if (containList.contains(permissionList!.myAttendance!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.attendence,
          title: "My Attendence",
        ),
        // if (containList.contains(permissionList!.readInterview!.slug!))
        DrawerListTile(
          press: () {
            // print("object");
          },
          svgSrc: ImageConstant.interview,
          title: "Interview",
        ),
        // DrawerListTile(
        //   press: () {
        //     Get.toNamed(AppRoutes.notesScreen);
        //   },
        //   svgSrc: ImageConstant.notes,
        //   title: "Notes Descipline",
        // ),
        // if (containList.contains(permissionList!.readSalary!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.salary,
          title: "Salary",
        ),
        // if (containList.contains(permissionList!.mySalary!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.salary,
          title: "My Salary",
        ),

        // if (containList.contains(permissionList!.readLeave!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.leave,
          title: "Leave",
        ),
        // if (containList.contains(permissionList!.myLeave!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.leave,
          title: "My Leave",
        ),
        // if (containList.contains(permissionList!.readHoliday!.slug!))
        DrawerListTile(
          press: () {},
          svgSrc: ImageConstant.hiring,
          title: "Holiday",
        ),
        // DrawerListTile(
        //   press: () {
        //     // Get.toNamed(AppRoutes.eventCalander);
        //   },
        //   svgSrc: ImageConstant.eventCalander,
        //   title: "Events Calendar",
        // ),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, svgSrc;
  final VoidCallback press;
  const DrawerListTile({
    super.key,
    required this.title,
    required this.press,
    required this.svgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: appTheme.amber800,
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        height: 25,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(title,
            style: TextStyle(color: appTheme.blueGray900, fontSize: 18)),
      ),
    );
  }
}
