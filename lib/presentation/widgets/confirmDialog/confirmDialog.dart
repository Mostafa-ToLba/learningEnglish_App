
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/presentation/widgets/customDialog/customDialog.dart';
import 'package:learning_anglish_app/presentation/widgets/update/animatedUpdate.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:provider/provider.dart';

class ConfirmCustomDialog {
  final String? title;
  final String? title2;
  final String? buttonText;
  var onTabPressed;
  ConfirmCustomDialog({
    this.title,this.title2,this.buttonText,this.onTabPressed
  });
  void showUpdateProfileDialogg(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Row(
            children: [
              SvgPicture.asset(IconResources.profile,
                  color: Theme.of(context).textTheme.displayMedium?.color),
              const SizedBox(width: 10),
               Text(title??'',style: TextStyle(color: Colors.black),),
            ],
          ),
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title2??'',
                textAlign: TextAlign.right,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {

                Navigator.of(context).pop();
              },
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorResources.buttonColor, // Button color
                onPrimary: Colors.white, // Text color
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
                textStyle: TextStyle(fontSize: 15.sp,fontFamily:AppConstants.arabicFont1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 5,
              ),
              onPressed:()
              {
                onTabPressed();
                Navigator.of(context).pop();
                ShowCustomDialog(
                    context: context, content:AnimatedUpdate(
                    updatedMassage: 'تم تحديث الملف الشخصي بنجاح')
                ).showCustomDialg(context);
              } ,
              child:  Text(buttonText??""),
            ),
          ],
        );
      },
    );
  }
}