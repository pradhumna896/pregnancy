import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';

// ignore: must_be_immutable
class EmptyContainer extends StatelessWidget {
  void Function() onTap;
  String? msg;
  EmptyContainer({required this.onTap, this.msg, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/empty2.svg",
            height: 200.h,
            width: 200.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            msg ?? "Something went wrong",
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleLargeBlack900Bold,
          ),
          SizedBox(
            height: 30.h,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 44.h,
              width: 160.h,
              decoration: BoxDecoration(
                  color: appTheme.orange,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                child: Text(
                  "Retry",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
