import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:provider/provider.dart';


class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.endPadding,
    this.isNeedHint = true,
    this.isPadding = true,
    this.suffix,
    this.readOnly = false,
    this.textInputType,
    this.validator,
    this.prefix,
    this.hintColor,
    this.text,
    this.isRegister,
    this.isSearch,
    this.text2,
    this.textColor,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? text;
  final String? text2;
  final double? endPadding;
  final bool? isNeedHint;
  final bool? isPadding;
  final bool? isRegister;
  final bool? isSearch;
  final Widget? suffix;
  final Widget? prefix;
  final bool? readOnly;
  final Color? hintColor;
  final Color? textColor;
  final TextInputType? textInputType;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: themeVm.isDark == true
                  ? ColorResources.expansionBorder
                  : Colors.transparent,
            ),
            color: themeVm.isDark == true ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: IntlPhoneField(
              disableLengthCheck: true,
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
              textAlign: TextAlign.start,
              initialCountryCode: 'EG',
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.h, horizontal: 24.w),
                hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: hintColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.r),
                  borderSide: BorderSide.none,
                ),
                //     suffixIcon: suffix ?? const SizedBox(),
                prefixIcon: prefix,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
