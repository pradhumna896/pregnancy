import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pragnancy_app/theme/app_color.dart';
import 'package:pragnancy_app/widgets/custom_image_view.dart';


// ignore: must_be_immutable
class CustomTopButtons extends StatelessWidget {
  bool? isTrashed;
  bool? isAdd;
  bool? isTrashedPer;
  Function()? addPress;
  Function()? deletePress;
  Function()? searchPress;
  Function()? refreshPress;

  CustomTopButtons(
      {super.key,
      this.addPress,
      this.deletePress,
      this.searchPress,
      this.refreshPress,
      this.isTrashed = false,
      this.isAdd,
      this.isTrashedPer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          height: 34.h,
          decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (addPress != null && isAdd!)
                InkWell(
                  onTap: addPress,
                  child: CustomImageView(
                    svgPath: "assets/svg/add_button.svg",
                  ),
                ),
              if (addPress != null && isAdd!) _buildVerDivider(),
              if (deletePress != null && isTrashedPer!)
                InkWell(
                  onTap: deletePress,
                  child: CustomImageView(
                    svgPath: isTrashed!
                        ? "assets/svg/trash.svg"
                        : "assets/svg/delete_button.svg",
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              if (deletePress != null && isTrashedPer!) _buildVerDivider(),
              if (searchPress != null)
                InkWell(
                  onTap: searchPress,
                  child: CustomImageView(
                    svgPath: "assets/svg/search_button.svg",
                  ),
                ),
              if (searchPress != null) _buildVerDivider(),
              InkWell(
                onTap: refreshPress,
                child: CustomImageView(
                  svgPath: "assets/svg/refresh.svg",
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container _buildVerDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 25.h,
      width: 1.w,
      color: AppColor.blackText,
    );
  }
}
