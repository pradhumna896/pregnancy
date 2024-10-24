import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pragnancy_app/theme/app_color.dart';
import 'package:pragnancy_app/theme/text_style.dart';
import 'package:pragnancy_app/theme/theme_helper.dart';
import '../core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.alignment,
      this.maxlength,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.textStyle,
      this.labelStyle,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.hintStyle,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.contentPadding,
      this.borderDecoration,
      this.fillColor,
      this.filled = true,
      this.validator,
      this.readOnly = false,
      this.onTap,
      this.onSave,
      this.labelText,
      this.maxLength,
      this.inputFormatters,
      this.footerText,
      this.initialValue,
      this.onChanged,
      this.isRequired = false});

  final Alignment? alignment;

  final double? width;

  final Function(String)? onChanged;

  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;
  final bool? obscureText;
  final bool readOnly;
  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;
  final int? maxlength;

  final String? hintText;

  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final void Function()? onTap;
  final void Function(String?)? onSave;

  final String? labelText;

  final int? maxLength;

  final List<TextInputFormatter>? inputFormatters;

  final FormFieldValidator<String>? validator;

  final String? footerText;

  final String? initialValue;

  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
        width: width ?? double.maxFinite,
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Text(labelText ?? '',
                      style: labelStyle ?? KtxtStyle().text14DarkBlackw700),
                ),
                if (isRequired!)
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.star, color: Colors.red, size: 10.sp)),
              ],
            ),
            TextFormField(
              maxLength: maxlength,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTap: onTap,
              onSaved: onSave,
              cursorColor: AppColor.primary,
              controller: controller,
              initialValue: initialValue,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              autofocus: autofocus!,
              style: textStyle ??
                  TextStyle(
                    color: Colors.black87,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
              obscureText: obscureText!,
              textInputAction: textInputAction??TextInputAction.done,
              keyboardType: textInputType,
              maxLines: maxLines ?? 1,
              decoration: decoration,
              validator: validator,
              readOnly: readOnly,
            ),
          ],
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? KtxtStyle().text14Hint500,
        labelStyle: KtxtStyle().text14Hint500,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        counterStyle: const TextStyle(color: Colors.white),
        errorStyle: const TextStyle(color: Colors.red),
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        fillColor: fillColor ?? AppColor.white,
        filled: filled,
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Color(0xffD4D0D0),
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColor.primary,
                width: 1,
              ),
            ),
        errorBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlinePrimary => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide(
          color: appTheme.orange.withOpacity(0.4),
          width: 1,
        ),
      );
  static OutlineInputBorder get outlinePrimaryTL102 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide(
          color: appTheme.orange.withOpacity(0.4),
          width: 1,
        ),
      );
}
