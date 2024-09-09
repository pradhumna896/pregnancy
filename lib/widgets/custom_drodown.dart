import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pragnancy_app/theme/app_color.dart';
import 'package:pragnancy_app/theme/custom_text_style.dart';
import 'package:pragnancy_app/theme/text_style.dart';
import 'package:pragnancy_app/theme/theme_helper.dart';

import '../core/app_export.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  final String labelText;
  void Function(String?)? onSave;
  void Function(String?)? onChng;
  String? Function(String?)? validator;
  Function(List<dynamic>)? onChanged;
  bool isMultiselect = false;
  String? selectedItem;
  List<dynamic>? multiSelected;
  bool showSearchBox;
  bool? isValidate;
  void Function(List<dynamic>, dynamic)? popupOnItemAdded;
  void Function(List<dynamic>, dynamic)? popupOnItemRemoved;
  final bool? isRequired;

  List<String> listName;
  CustomDropdown({
    this.onChng,
    this.multiSelected,
    this.popupOnItemRemoved,
    this.popupOnItemAdded,
    this.isValidate = true,
    required this.labelText,
    required this.listName,
    this.selectedItem,
    this.onSave,
    this.validator,
    this.isMultiselect = false,
    this.onChanged,
    this.showSearchBox = false,
    this.isRequired = false,
    super.key,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? value = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Text(widget.labelText,
                  style: KtxtStyle().text14DarkBlackw700),
            ),
            if (widget.isRequired!)
              Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(Icons.star, color: Colors.red, size: 10.sp)),
          ],
        ),
        Stack(
          children: [
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.01),
                    offset: const Offset(0, 0),
                    spreadRadius: 8)
              ], borderRadius: BorderRadius.circular(15)),
            ),
            widget.isMultiselect
                ? DropdownSearch.multiSelection(
                    dropdownBuilder: (context, selectedItem) {
                      return selectedItem.isEmpty
                          ? Text(widget.labelText,
                              style: KtxtStyle().text14Hint500
                              // style: AppTextStyles.bodyText,
                              )
                          : Text(
                              selectedItem.map((e) => e).join(', '),
                              style: KtxtStyle().text14Hint500,
                            );
                    },
                    selectedItems: widget.multiSelected ?? [],

                    // to check validation
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select one or more option';
                      }
                      return null;
                    },
                    compareFn: (item, selectedItem) {
                      return item == selectedItem;
                    },
                    filterFn: (item, filter) {
                      return item.toLowerCase().contains(filter.toString());
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: customInputDecoration(
                            appTheme.whiteA700, widget.labelText, false)),
                    dropdownButtonProps: const DropdownButtonProps(
                        icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                    )),
                    items: widget.listName,
                    onChanged: widget.onChanged,
                  )
                : DropdownSearch<String>(
                    clearButtonProps: const ClearButtonProps(isVisible: true),
                    selectedItem: widget.selectedItem,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: widget.validator,
                    dropdownBuilder: (context, selectedItem) {
                      return Text(selectedItem ?? widget.labelText,
                          style: KtxtStyle().text14Hint500
                          // style: AppTextStyles.bodyText,
                          );
                    },
                    onSaved: widget.onSave,
                    items: widget.listName.toList(),
                    onChanged: widget.onChng,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: customInputDecoration(
                            appTheme.whiteA700, widget.labelText, false)),
                  ),
          ],
        ),
      ],
    );
  }

  customInputDecoration(Color fillColor, String hintText, bool isPrefixIcon,
      {IconButton? iconButton,
      Widget? prefixIcon,
      Widget? suffixIcon,
      String? counterText,
      bool? offStage,
      bool? isDense,
      TextStyle? counterStyle,
      String? labelText,
      String? errorText}) {
    double radius = 10;
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.h),
      labelText: labelText,
      counterStyle: counterStyle,
      counterText: counterText,
      isDense: isDense ?? false,
      errorText: errorText,
      hintText: hintText,
      hintStyle: CustomTextStyles.bodySmallBlack900,
      errorStyle: CustomTextStyles.bodySmallBlack900.copyWith(
          color: appTheme.red600D8,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp),
      prefixIcon: isPrefixIcon == false
          ? null
          : Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: prefixIcon,
            ),
      suffixIcon: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          bottom: 20.h,
        ),
        child: suffixIcon,
      ),
      filled: true,
      fillColor: fillColor,
      counter: Offstage(
        offstage: offStage ?? true,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide:
            BorderSide(color: AppColor.primary.withOpacity(0.2), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: AppColor.primary, width: 1)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Colors.red.withOpacity(0.8), width: 1)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide:
              BorderSide(color: appTheme.orange.withOpacity(0.2), width: 1)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.grey, width: 1)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.grey, width: 1)),
    );
  }

  // ignore: unused_element
  _textLabel() {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
            padding: EdgeInsets.only(bottom: 5.h, right: 15.h),
            child: Text(
              widget.labelText,
              // style: AppTextStyles.bodyText,
            )),
      ],
    );
  }
}
