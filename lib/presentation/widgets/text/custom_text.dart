import 'package:flutter/material.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';



class CustomText extends StatelessWidget {
  final String text;
  final double?txtSize;
  final FontWeight?fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final Function()? onTap;

  const CustomText({super.key, required this.text, this.txtSize, this.fontWeight,
    this.color ,
    this.textAlign=TextAlign.center, this.onTap});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Text((text),
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style:  TextStyle(
            color: color,
            fontSize: txtSize,
            fontWeight: fontWeight??FontWeight.w400,
            fontFamily: AppConstants.arabicFont1,
          )),
    );
  }
}
