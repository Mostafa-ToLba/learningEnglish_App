import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/color_resource/color_resources.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 800.h,
      decoration: BoxDecoration(
          color: ColorResources.grey1,
          shape: BoxShape.circle
      ),
    );
  }
}
