import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/userProfile_vm/userProfile_vm.dart';
import 'package:learning_anglish_app/data/web_services/end_points.dart';
import 'package:learning_anglish_app/presentation/screens/notification/notification_screen.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.read<UserProfileViewModel>().getUserProfile();
    });
    super.initState();
  }

  void launchWhatsapp(
      String phone,
      String message,
      ) async {
    final url = 'https://wa.me/+20$phone?text=$message';

    await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
  @override
  Widget build(BuildContext context) {
    final profileVm = Provider.of<UserProfileViewModel>(context);
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
              profileVm.userProfile != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22.0,
                            backgroundImage:profileVm.userProfile!.data!.userImgUrl!=null? NetworkImage(EndPoints.imagesUrl+
                                profileVm.userProfile!.data!.userImgUrl!):null,
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            "Mostafa Mahmoud",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.fontFamily,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
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
              // ListTile(
              //   horizontalTitleGap: 20.w,
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const NotificationScreen()));
              //   },
              //   trailing: Icon(
              //     Icons.notifications,
              //     size: 28.dg,
              //     color: Colors.white,
              //   ),
              //   // const Icon(Icons.star_border, size: 20.0, color: Colors.white),
              //   title: Text(
              //     'الأشعارات',
              //     textDirection: TextDirection.rtl,
              //     style: TextStyle(
              //       fontSize: 15.sp,
              //       fontWeight: FontWeight.w500,
              //       fontFamily:
              //           Theme.of(context).textTheme.titleSmall?.fontFamily,
              //     ),
              //   ),
              //   textColor: Colors.white,
              //   dense: true,
              //
              //   // padding: EdgeInsets.zero,
              // ),
              ListTile(
                horizontalTitleGap: 20.w,
                onTap: ()
                 {
                  launchWhatsapp('1090964348','لو سمحت انا محتاج اشتري الحصة');
                },
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
