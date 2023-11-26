import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import '../../../utils/color_resource/color_resources.dart';
import '../text/custom_text.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.widgetInCenter,
      this.isSelected = false,
      this.onTap,
      this.color,
      //this.colorTxt,
      this.isGradient,
      this.textSize,
      //this.textWeight,
      this.colorBorder,
      this.width,
      this.height,
      //this.leading,
      this.widget})
      : super(key: key);
  final Widget widgetInCenter;
  final double? textSize;
  final double? width;
  final double? height;
  //final double? leading;
  //final FontWeight? textWeight;
  final bool isSelected;
  final bool? isGradient;
  final Color? color;
  final Color? colorBorder;
  //final Color? colorTxt;
  final Widget? widget;
  final GestureTapCallback? onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.all(Radius.circular(32.r)),
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          height: widget.height ?? 56.h,
          width: widget.width ?? 327.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32.r)),
            color: widget.isSelected
                ? Theme.of(context).primaryColor
                : widget.color,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: 0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //SizedBox(width: widget.leading ?? 50.w),
                  SizedBox(width: 50.w),
                  const Spacer(),
                  //SizedBox(width: 50.w),
                  widget.widgetInCenter,
                  /*
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      text: widget.text,
                      textAlign: TextAlign.center,
                      color: widget.isSelected
                          ? ColorResources.white1
                          : widget.colorTxt,
                      txtSize: widget.textSize ?? 17.sp,
                      fontWeight: widget.textWeight ?? FontWeight.w600,
                    ),
                  ),*/

                  const Spacer(),
                  //SizedBox(width: 60.w),

                  Container(
                    width: 40.w,
                    height: 40.h,
                    margin: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 24.w),
                    //minRadius: 22.h,
                    decoration: BoxDecoration(
                      color: ColorResources.arrowRightBackground,
                      borderRadius: BorderRadius.circular(22.dm),
                    ),
                    // Customize the background color
                    child: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      IconResources.arrowRight,
                      color: Colors.white,
                    ), // Set the image
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
