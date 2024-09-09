import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class FilterDrodown extends StatelessWidget {
  String? selectValue;
  List<String>? months;
  FilterDrodown({super.key, this.months, this.selectValue});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150.w,
        height: 40.h,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD5D5D5)),
            borderRadius: BorderRadius.circular(10.r)),
        child: Center(
          child: DropdownButton<String>(
              hint: const Text("Fab"),
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
              ),
              value: selectValue,
              underline: Container(),
              borderRadius: BorderRadius.circular(10.r),
              items: months!
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value:
                          value, // add this property an pass the _value to it
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          value,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                selectValue = value;
              }),
        ));
  }
}
