import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/main/home_view.dart';
import 'package:learning_anglish_app/presentation/screens/main/profile_settings_view.dart';
import 'package:learning_anglish_app/presentation/screens/main/question_bank_view.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;
  static const List<Widget> _widgetOptions = <Widget>[
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
    return Scaffold(
      backgroundColor: ColorResources.grey5,
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(56.r)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 5,
          backgroundColor:  ColorResources.white1,
          unselectedIconTheme: IconThemeData(color: ColorResources.brownDark),
          selectedIconTheme: IconThemeData(color: ColorResources.white1),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Profile',
              activeIcon: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: ColorResources.brownDark,
                ),
                child: const Icon(Icons.person),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.book_online_outlined),
              label: 'Questions',
              activeIcon: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: ColorResources.brownDark,
                ),
                child: const Icon(Icons.book_online_outlined),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              activeIcon: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: ColorResources.brownDark,
                ),
                child: const Icon(Icons.home),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
