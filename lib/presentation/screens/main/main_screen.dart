import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/blocs/settings_bloc/settings_bloc.dart';
import 'package:learning_anglish_app/presentation/screens/main/home_view.dart';
import 'package:learning_anglish_app/presentation/screens/main/profile_settings_view.dart';
import 'package:learning_anglish_app/presentation/screens/main/question_bank_view.dart';
import 'package:learning_anglish_app/presentation/widgets/drawer/app_drawer.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key

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
    final mode = context.watch<SettingsBloc>().state.mode;
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: AppDrawer(
        mode: mode,
        onExitPressed: () {
          scaffoldKey.currentState!.closeDrawer();
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(56.r)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 5,
          backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Profile',
              activeIcon: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                 
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
                decoration:  BoxDecoration(
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
