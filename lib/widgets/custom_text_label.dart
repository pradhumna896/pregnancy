import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pragnancy_app/theme/app_color.dart';
import 'package:pragnancy_app/theme/text_style.dart';

import '../core/app_export.dart';

class CustomTextLabel extends StatelessWidget {
  final String title;
  final String value;
  const CustomTextLabel(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        "$title:",
        style: KtxtStyle().text16DarkBlackw600.copyWith(color: AppColor.grey),
      ),
      SizedBox(
        width: 10.w,
      ),
      Expanded(
        child: Text(
          value,
          style: KtxtStyle().text16DarkBlackw600.copyWith(color: AppColor.grey,fontWeight: FontWeight.w400),
        ),
      ),
    ]);
  }
}