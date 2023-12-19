import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/data/web_services/end_points.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/images/images.dart';

class CustomAppBarWithImageAndMenu extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final String? imageURL;
  final String? name;
  final bool? menuIcon;
  const CustomAppBarWithImageAndMenu(
      {super.key,
      required this.onMenuPressed,
      required this.imageURL,
      required this.name,
      this.menuIcon = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Row(
        children: [
          if (menuIcon!)
            IconButton(
                onPressed: onMenuPressed,
                icon: Image(
                  image: const AssetImage(
                    Images.menu1,
                  ),
                  width: 20.w,
                  height: 20.h,
                  color: Theme.of(context).textTheme.displayMedium!.color,
                )),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'أهلا بك',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppConstants.arabicFont1,
                  color: ColorResources.appGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                name??'',
                textAlign: TextAlign.center,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Theme.of(context).textTheme.displayMedium!.color,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 0.07.h,
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          InkWell(
            onTap: ()
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),

                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // Dismiss the dialog on tap
                      },
                      child: SizedBox(
                          width: 400.w, // Adjust dimensions as needed
                          height: 400.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image(
                              fit: BoxFit.cover,
                              image:NetworkImage(imageURL??''),),
                          )// Display the profile image
                      ),
                    ),
                  );
                },
              );
            },
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: Theme.of(context).textTheme.displayMedium!.color,
              backgroundImage: NetworkImage(imageURL??''),
            ),
          ),
        ],
      ),
    );
  }
}
