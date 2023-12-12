import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/presentation/screens/main/home_view.dart';
import 'package:learning_anglish_app/presentation/screens/main/profile_settings_view.dart';
import 'package:learning_anglish_app/presentation/screens/main/question_bank_view.dart';
import 'package:learning_anglish_app/presentation/widgets/drawer/app_drawer.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static final GlobalKey<SideMenuState> sideMenuKey =
      GlobalKey<SideMenuState>();
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key

  int _selectedIndex = 2;
  static final List<Widget> _widgetOptions = <Widget>[
    const ProfileSettingsView(),
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
    return SideMenu(
      key: MainScreen.sideMenuKey,
      type: SideMenuType.slideNRotate,
      inverse: true,
      maxMenuWidth: 230.w,
      radius: BorderRadius.circular(10.sp),
      menu: const AppDrawer(),
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
            unselectedIconTheme:
                Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconResources.profile,
                    color: Theme.of(context).textTheme.displayMedium?.color),
                label: 'Profile',
                activeIcon: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: ColorResources.brownDark,
                  ),
                  child: SvgPicture.asset(IconResources.profile,
                      fit: BoxFit.scaleDown, color: Colors.white),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconResources.bank,
                  color: Theme.of(context).textTheme.displayMedium?.color,
                ),
                label: 'Questions',
                activeIcon: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: ColorResources.brownDark,
                  ),
                  child: SvgPicture.asset(IconResources.bank,
                      fit: BoxFit.scaleDown, color: Colors.white),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconResources.home,
                    color: Theme.of(context).textTheme.displayMedium?.color),
                label: 'Home',
                activeIcon: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: ColorResources.brownDark,
                  ),
                  child: SvgPicture.asset(IconResources.home,
                      fit: BoxFit.scaleDown),
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


