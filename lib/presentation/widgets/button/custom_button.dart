import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import '../../../utils/color_resource/color_resources.dart';
import '../text/custom_text.dart';

class CustomButton extends StatefulWidget {
   const CustomButton({Key? key,required this.text,
    this.isSelected=false,this.onTap, this.color, this.colorTxt, this.isGradient, this.textSize, this.textWeight,this.colorBorder, this.width, this.height, this.widget}) : super(key: key);
  final String text;
  final double? textSize;
  final double? width;
  final double? height;
  final FontWeight? textWeight;
  final bool isSelected;
  final bool? isGradient;
  final Color? color;
  final Color? colorBorder;
  final Color? colorTxt;
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
      borderRadius:  BorderRadius.all(Radius.circular(32.r)) ,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
            height:widget.height??56.h,
            width: widget.width??MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.all(Radius.circular(32.r)),
              color: widget.isSelected?
              Theme.of(context).primaryColor: widget.color,
            ),
            child:  Center(
              child: Padding(
                padding:  EdgeInsets.only(right: 0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20.w),
                    CircleAvatar(
                      minRadius: 22.h,
                      backgroundColor: HexColor('#35312B'), // Customize the background color
                      child: SvgPicture.asset(IconResources.arrowRight,color: Colors.white,), // Set the image
                    ),
                    SizedBox(width: 50.w),
                    CustomText(text:
                      widget.text,textAlign: TextAlign.center,
                      color: widget.isSelected?
                           ColorResources.white
                          :widget.colorTxt,
                      txtSize: widget.textSize??17.sp,
                      fontWeight:widget.textWeight?? FontWeight.w600,
                      )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
