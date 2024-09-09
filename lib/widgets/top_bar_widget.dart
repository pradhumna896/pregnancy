import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TopBarWidget extends StatelessWidget {
  final Widget? child;
  final double? height;
  const TopBarWidget({super.key, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        height: height ?? 200.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffAD8CFD),
              Color(0xffE3E3E3),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double offset = 60.0.h;
    Path path = Path();
    path.lineTo(0, height - offset);
    path.quadraticBezierTo(width / 4, height, width / 2, height - offset);
    path.quadraticBezierTo(
        3 * width / 4, height - (2 * offset), width, height - 20.h);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return true;
  }
}
