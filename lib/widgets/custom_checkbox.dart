import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pragnancy_app/theme/app_color.dart';

import '../core/app_export.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    required this.title,
    super.key,
  });

  final bool? value;
  final Function(bool?) onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: AppColor.primary,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Raleway"),
        ),
      ],
    );
  }
}
