import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pragnancy_app/theme/app_color.dart';
import 'package:pragnancy_app/theme/text_style.dart';
import 'package:pragnancy_app/widgets/custom_eleveted_button.dart';



class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        onTap: () {
          Navigator.pop(context);
        },
          buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: AppColor.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r))),
          text: Text(
            "Close",
            style: KtxtStyle().text14Whitew700,
          )),
    );
  }
}
