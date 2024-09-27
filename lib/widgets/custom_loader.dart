import 'package:flutter/material.dart';
import 'package:pragnancy_app/theme/app_color.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        height: 30, 
        width: 30,
        child: CircularProgressIndicator(
              color: AppColor.blue,
              strokeWidth: 3,
            ),
      ),
    );
  }
}
