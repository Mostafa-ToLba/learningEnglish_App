import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_anglish_app/presentation/screens/notification/notification%20_screen.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemesViewModel>(
      builder: (BuildContext context, themeVm, Widget? child) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22.0,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1508184964240-ee96bb9677a7?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "Mostafa Mahmoud",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:
                            Theme.of(context).textTheme.titleSmall?.fontFamily,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              ListTile(
                horizontalTitleGap: 20.w,
                onTap: () {
                  themeVm.setTheme(
                      themeVm.isDark == null ? false : themeVm.isDark!);
                },
                trailing: SvgPicture.asset(IconResources.moon),
                title: Text(
                  'الوضع الليلي',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                        Theme.of(context).textTheme.titleSmall?.fontFamily,
                  ),
                ),
                textColor: Colors.white,
              ),
              ListTile(
                horizontalTitleGap: 20.w,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                },
                trailing: Icon(
                  Icons.notifications,
                  size: 28.dg,
                  color: Colors.white,
                ),
                // const Icon(Icons.star_border, size: 20.0, color: Colors.white),
                title: Text(
                  'الأشعارات',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                        Theme.of(context).textTheme.titleSmall?.fontFamily,
                  ),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              ListTile(
                horizontalTitleGap: 20.w,
                onTap: () {},
                trailing: SvgPicture.asset(IconResources.whatsapp),
                // const Icon(Icons.star_border, size: 20.0, color: Colors.white),
                title: Text(
                  'تواصل معنا',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                        Theme.of(context).textTheme.titleSmall?.fontFamily,
                  ),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              ListTile(
                horizontalTitleGap: 20.w,
                onTap: () async {},
                trailing: SvgPicture.asset(IconResources.googlePlay),
                // const Icon(Icons.girl, size: 20.0, color: Colors.white),
                title: Text(
                  'تقييم التطبيق',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                        Theme.of(context).textTheme.titleSmall?.fontFamily,
                  ),
                ),
                textColor: Colors.white,
                dense: true,
                // padding: EdgeInsets.zero,
              ),
              ListTile(
                horizontalTitleGap: 20.w,
                onTap: () async {},
                trailing: SvgPicture.asset(IconResources.setting2),
                //   const Icon(Icons.settings, size: 20.0, color: Colors.white),
                title: Text(
                  'الاعدادات',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                        Theme.of(context).textTheme.titleSmall?.fontFamily,
                  ),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              ListTile(
                horizontalTitleGap: 20.w,
                onTap: () {},
                trailing: SvgPicture.asset(IconResources.messageQuestion),
                // const Icon(Icons.star_border, size: 20.0, color: Colors.white),
                title: Text(
                  'المساعده',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                        Theme.of(context).textTheme.titleSmall?.fontFamily,
                  ),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              ListTile(
                horizontalTitleGap: 20.w,
                onTap: () async {},
                trailing: Icon(Icons.privacy_tip_outlined,
                    size: 22.sp, color: Colors.white),
                //const Icon(Icons.monetization_on, size: 20.0, color: Colors.white),
                title: Text(
                  'سياسة الخصوصية',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                        Theme.of(context).textTheme.titleSmall?.fontFamily,
                  ),
                ),
                textColor: Colors.white,
                dense: true,
                // padding: EdgeInsets.zero,
              ),
              ListTile(
                horizontalTitleGap: 20.w,
                onTap: () {},
                trailing: Icon(Icons.verified_outlined,
                    size: 22.sp, color: Colors.white),
                // const Icon(Icons.star_border, size: 20.0, color: Colors.white),
                title: Text(
                  'إصدار 1.0.0',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                        Theme.of(context).textTheme.titleSmall?.fontFamily,
                  ),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ],
          ),
        );
      },
    );
  }
}
