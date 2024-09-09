import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pragnancy_app/theme/theme_helper.dart';
import '../core/app_export.dart';

final toast = FToast();
buildToast(
  toast,
  msg, {
  toastColor,
  icon,
  iconColor,
  textColor,
}) =>
    Card(
      elevation: 4,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: toastColor ?? appTheme.green600,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: appTheme.whiteA700),
                child: Icon(icon ?? Icons.check,
                    color: iconColor ?? appTheme.green600)),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Text(
                msg,
                style: TextStyle(
                  color: textColor ?? appTheme.whiteA700,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );

void showSuccessToast(
  toast,
  msg,
) =>
    toast.showToast(
      child: buildToast(
        toast,
        msg,
      ),
      gravity: ToastGravity.BOTTOM,
    );
void showErrorToast(
  toast,
  msg, {
  toastColor,
  icon,
  iconColor,
  textColor,
}) =>
    toast.showToast(
      child: buildToast(
        toast,
        msg,
        toastColor: appTheme.red600D8,
        icon: Icons.close,
        iconColor: appTheme.red600D8,
      ),
      //duration: Duration(seconds: 5),
      gravity: ToastGravity.BOTTOM,
    );
void showWarrningToast(
  toast,
  msg, {
  toastColor,
  icon,
  iconColor,
  textColor,
}) =>
    toast.showToast(
      child: buildToast(toast, msg,
          toastColor: appTheme.whiteA700,
          icon: Icons.error_outline,
          iconColor: appTheme.black900,
          textColor: appTheme.black900),
      gravity: ToastGravity.BOTTOM,
    );
