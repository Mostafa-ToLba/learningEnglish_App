import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/presentation/widgets/connectionAppBar/connectionAppBar.dart';
import 'package:learning_anglish_app/presentation/widgets/drawer/app_drawer.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:provider/provider.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    //connection
    final mainScreenVm = Provider.of<MainScreenViewModel>(context,listen: false);
    mainScreenVm.initConnectivity();
    mainScreenVm.connectionListen();
    //connection
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final mainScreenVm = Provider.of<MainScreenViewModel>(context);
    return SideMenu(
      key: mainScreenVm.sideMenuKey,
      type: SideMenuType.slideNRotate,
      inverse: true,
      maxMenuWidth: 230.w,
      radius: BorderRadius.circular(10.sp),
      menu: const AppDrawer(),
      background: ColorResources.buttonColor,
      child: Scaffold(
        appBar: mainScreenVm.connectionStatus==ConnectivityResult.none?connectionAppBar():null,
        drawerEnableOpenDragGesture: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: mainScreenVm.widgetOptions.elementAt(mainScreenVm.selectedIndex),
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
            currentIndex: mainScreenVm.selectedIndex,
            onTap: mainScreenVm.onItemTapped,
          ),
        ),
      ),
    );
  }
}

