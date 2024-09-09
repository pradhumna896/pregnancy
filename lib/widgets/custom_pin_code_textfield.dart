import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pragnancy_app/theme/app_color.dart';
import 'package:pragnancy_app/theme/theme_helper.dart';
import '../core/app_export.dart';
import '../theme/custom_text_style.dart';


// ignore: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    super.key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.margin,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  });

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: PinCodeTextField(
          appContext: context,
          controller: controller,
          length: 5,
          keyboardType: TextInputType.number,
          textStyle: textStyle ?? CustomTextStyles.titleLargeBlack90021,
          hintStyle: hintStyle ?? CustomTextStyles.titleLargeBlack90021,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          enableActiveFill: true,
          pinTheme: PinTheme(
            fieldHeight: 40.h,
            fieldWidth: 40.h,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10.h),
            
            inactiveColor: AppColor.primary.withOpacity(0.5),
            activeColor: AppColor.primary.withOpacity(0.5),
            inactiveFillColor: appTheme.whiteA700.withOpacity(0.85),
            activeFillColor: appTheme.whiteA700.withOpacity(0.85),
            selectedFillColor: AppColor.primary.withOpacity(0.5),
            selectedColor: Colors.white,
          ),
          onChanged: (value) => onChanged(value),
          validator: validator,
        ),
      );
}
