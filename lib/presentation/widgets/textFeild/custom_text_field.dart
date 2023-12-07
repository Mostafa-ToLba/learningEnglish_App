import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import '../../../utils/color_resource/color_resources.dart';
import '../text/custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: text!,
                  txtSize: 14,
                  fontWeight: FontWeight.w400,
                  color: textColor ?? ColorResources.black),
              CustomText(
                  text: text2 ?? '',
                  txtSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorResources.grey2),
            ],
          ),
        SizedBox(
          height: 56.h,
          width: double.infinity,
          child: TextFormField(
            textDirection: TextDirection.rtl,
            maxLines: 1,
            textAlign: TextAlign.end,
            validator: validator,
            readOnly: readOnly!,
            controller: controller,
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
              focusedBorder: isRegister == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.r),
                      borderSide: BorderSide(
                        color: ColorResources.black,
                        width: 1,
                      ))
                  : isSearch == true
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.r),
                          borderSide: BorderSide(
                              color: ColorResources.black, width: .1),
                        ),
              suffixIcon: suffix ?? const SizedBox(),
              prefixIcon: prefix,
              border: isRegister == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.r),
                      borderSide:
                          BorderSide(color: ColorResources.black, width: 1))
                  : isSearch == true
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.r),
                          borderSide: BorderSide(
                            color: ColorResources.black,
                            width: .1,
                          ),
                        ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.r),
                borderSide: BorderSide(
                  color: ColorResources.appGreyColor,
                  width: .5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
