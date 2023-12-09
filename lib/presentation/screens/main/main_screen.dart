import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/blocs/settings_bloc/settings_bloc.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/presentation/screens/main/home_view.dart';
import 'package:learning_anglish_app/presentation/screens/main/profile_settings_view.dart';
import 'package:learning_anglish_app/presentation/screens/main/question_bank_view.dart';
import 'package:learning_anglish_app/presentation/widgets/drawer/app_drawer.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:provider/provider.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key

  int _selectedIndex = 2;
  static List<Widget> _widgetOptions = <Widget>[
    ProfileSettingsView(),
    QuestionBankView(),
    HomeView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
  //  final mode = context.watch<SettingsBloc>().state.mode;

    return SideMenu(
      key: MainScreen.sideMenuKey,
      type: SideMenuType.slideNRotate,
      inverse: true,
      maxMenuWidth: 230.w,
      radius: BorderRadius.circular(10.sp),
      menu: buildMenu(context),
      background: ColorResources.buttonColor,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(56.r)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 5,
            backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            unselectedIconTheme: Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconResources.profile,color:Theme.of(context).textTheme.displayMedium?.color),
                label: 'Profile',
                activeIcon: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: ColorResources.brownDark,
                  ),
                  child: SvgPicture.asset(IconResources.profile,fit: BoxFit.scaleDown,color:Colors.white),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconResources.bank,color: Theme.of(context).textTheme.displayMedium?.color,),
                label: 'Questions',
                activeIcon: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: ColorResources.brownDark,
                  ),
                  child: SvgPicture.asset(IconResources.bank,fit: BoxFit.scaleDown,color: Colors.white),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconResources.home,color: Theme.of(context).textTheme.displayMedium?.color),
                label: 'Home',
                activeIcon: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: ColorResources.brownDark,
                  ),
                  child: SvgPicture.asset(IconResources.home,fit: BoxFit.scaleDown),
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}


Widget buildMenu(context) {
  final themeVm = Provider.of<ThemesViewModel>(context);
  return SingleChildScrollView(
    padding:  EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
         Padding(
          padding: EdgeInsets.only(right: 16.w),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22.0,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1508184964240-ee96bb9677a7?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
              const SizedBox(height: 16.0),
              Text(
                "Mostafa Mahmoud",
                style: TextStyle(color: Colors.white,fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
        ListTile(
          horizontalTitleGap: 20.w,
          onTap: ()
          {
            themeVm.setTheme(!themeVm.isDark);
          },
          trailing: Icon(Icons.dark_mode, size: 25.sp, color: Colors.white),
          title:  Text('الوضع الليلي',textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
          textColor: Colors.white,
        ),
        ListTile(

          horizontalTitleGap: 20.w,
          onTap: ()
          {

          },
          trailing:Icon(FontAwesomeIcons.whatsapp, size: 25.sp, color: Colors.white),
          // const Icon(Icons.star_border, size: 20.0, color: Colors.white),
          title:  Text('تواصل معنا',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          horizontalTitleGap: 20.w,
          onTap: ()
          async {

          },
          trailing: Icon(FontAwesomeIcons.googlePlay, size: 25.sp, color: Colors.white),
          // const Icon(Icons.girl, size: 20.0, color: Colors.white),
          title:  Text('تقييم التطبيق',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
          textColor: Colors.white,
          dense: true,
          // padding: EdgeInsets.zero,
        ),
        ListTile(
          horizontalTitleGap: 20.w,
          onTap: ()
          async {

          },
          trailing: Icon(FontAwesomeIcons.gear, size: 25.sp, color: Colors.white),
          //   const Icon(Icons.settings, size: 20.0, color: Colors.white),
          title:  Text('الاعدادات',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          horizontalTitleGap: 20.w,
          onTap: ()
          {

          },
          trailing: Icon(FontAwesomeIcons.circleQuestion, size: 25.sp, color: Colors.white),
          // const Icon(Icons.star_border, size: 20.0, color: Colors.white),
          title:  Text('المساعده',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          horizontalTitleGap: 20.w,
          onTap: ()
          async {

          },
          trailing: Icon(Icons.privacy_tip, size: 25.sp, color: Colors.white),
          //const Icon(Icons.monetization_on, size: 20.0, color: Colors.white),
          title:  Text('سياسة الخصوصية',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
          textColor: Colors.white,
          dense: true,
          // padding: EdgeInsets.zero,
        ),
        ListTile(
          horizontalTitleGap: 20.w,
          onTap: ()
          {
          },
          trailing: Icon(Icons.verified, size: 25.sp, color: Colors.white),
          // const Icon(Icons.star_border, size: 20.0, color: Colors.white),
          title:  Text('إصدار 1.0.0',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),

      ],
    ),
  );
}