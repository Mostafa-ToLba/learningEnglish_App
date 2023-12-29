import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/presentation/widgets/connectionAppBar/connectionAppBar.dart';
import 'package:learning_anglish_app/presentation/widgets/drawer/app_drawer.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:provider/provider.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:switcher_button/switcher_button.dart';


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
            type: BottomNavigationBarType.fixed,
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
                icon: SvgPicture.asset(IconResources.notification,
                    color: Theme.of(context).textTheme.displayMedium?.color),
                label: 'Notification',
                activeIcon: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: ColorResources.brownDark,
                  ),
                  child: SvgPicture.asset(IconResources.notification,
                      fit: BoxFit.scaleDown, color: Colors.white),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconResources.bank,
                    color: Theme.of(context).textTheme.displayMedium?.color),
                label: 'Exams',
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
                icon: SvgPicture.asset(
                  IconResources.messageQuestion,height: 25.h,
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
                  child: SvgPicture.asset(IconResources.messageQuestion,height: 25.h,
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

    /*
      Scaffold(
      key: mainScreenVm.scaffoldkey,
      appBar: mainScreenVm.connectionStatus==ConnectivityResult.none?connectionAppBar():null,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
      width: 300.w,
      child: Container(
        height: 100.h,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black, Colors.black],
            )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(
                  //        height: 10.h,
                  height: 7.h,
                ),
              Center(
                child: Container(
                  height: 25.h,
                  //height :22.h

                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.7.h,right: 2.7.h,top: 3.h,left: 2.5.h),
                child: Row(
                  children: [

                    SizedBox(
                      width: 9.sp,
                    ),
                    Container(
                      width: 40.w,
                      child: Text(
                        'tap sound',
                        style: TextStyle(

                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const Spacer(),
                    SwitcherButton(
                      offColor:  HexColor('#073eab')
                          ,
                      size: 37.sp,
                      value: true,
                      onChange: (value) async {

                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.h, right: 2.7.h,),
                child: Row(
                  children: [
                    // Image(
                    //   fit: BoxFit.cover,
                    //   color: Colors.white,
                    //   alignment: AlignmentDirectional.center,
                    //   height: 24.sp,
                    //   image: const AssetImage('assets/newImages/dayAndNight.png',),
                    // ),
                    SizedBox(
                      width: 8.sp,
                    ),
                    Container(
                      width: 40.w,
                      child: Text(
                        'dark mode',
                        style: TextStyle(

                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 3.sp),
                      child: SwitcherButton(
                        size: 37.sp,
                        offColor: Colors.grey,
                        value: true,
                        onChange: (value) async {

                        },
                      ),
                    ),
                  ],
                ),
              ),
              /*
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () async{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FavoriteScreen(),
                                  ),
                                );
                                if(AppCubit.get(context).music==true)
                                {
                                  final file = await AudioCache().loadAsFile('mixin.wav');
                                  final bytes = await file.readAsBytes();
                                  AudioCache().playBytes(bytes);
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    IconBroken.Heart,
                                    size: 25.sp,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Liked Quotes',
                                    style: TextStyle(
                                        fontFamily: 'Forum',
                                        fontSize: 17.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )),
                        ),
                      ),

                       */
              SizedBox(
                height: 2.2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.h,right: 2.7.h),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () async {

                      },
                      child: Row(
                        children: [
                          // Image(
                          //   fit: BoxFit.cover,
                          //   color: Colors.white,
                          //   alignment: AlignmentDirectional.center,
                          //   height: 25.sp,
                          //   image: const AssetImage('assets/newImages/shareNew.png',),
                          // ),
                          SizedBox(
                            width: 7.sp,
                          ),
                          Container(
                            width:40.w,
                            child: Text(
                              'share app',
                              style: TextStyle(

                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.3.h,right: 2.7.h),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () async {

                      },
                      child: Row(
                        children: [
                          // Image(
                          //   fit: BoxFit.cover,
                          //   color: Colors.white,
                          //   alignment: AlignmentDirectional.center,
                          //   height: 20.sp,
                          //   image: const AssetImage('assets/newImages/phoneNew.png',),
                          // ),
                          SizedBox(
                            width:13.sp,
                          ),
                          Text(
                            'contact us',
                            style: TextStyle(

                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.3.h,right: 2.7.h),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () async {

                      },
                      child: Row(
                        children: [
                          // Image(
                          //   fit: BoxFit.cover,
                          //   color: Colors.white,
                          //   alignment: AlignmentDirectional.center,
                          //   height: 21.sp,
                          //   image: const AssetImage('assets/newImages/starNew.png',),
                          // ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Container(
                            width: 40.w,
                            child: Text(
                              'rate us',
                              style: TextStyle(

                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: .1.h,
                color: Colors.white38,
              ),

              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.3.h,right: 2.h),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: .4.h),
                                // child: Image(
                                //   fit: BoxFit.cover,
                                //   color: Colors.white,
                                //   alignment: AlignmentDirectional.center,
                                //   height: 23.sp,
                                //   image: const AssetImage('assets/newImages/system-update.png',),
                                // ),
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Container(
                                width: 55.w,
                                child:  Text(
                                  'app version',
                                  style: TextStyle(

                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 11.w,top: .6.h,right: 11.w),
                            child: Text(
                              '1.0.9',
                              style: TextStyle(

                                  fontSize: 10.sp,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      /*
                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 'app version',
                                 style: TextStyle(

                                     fontSize: 15.sp,
                                     color: Colors.white,
                                     fontWeight: FontWeight.w800),
                               ),
                               Padding(
                                 padding: EdgeInsets.all(.8.h),
                                 child: Text(
                                   '1.0.8',
                                   style: TextStyle(

                                       fontSize: 10.sp,
                                       color: Colors.white70,
                                       fontWeight: FontWeight.w600),
                                 ),
                               ),
                             ],
                           ),

                            */

                      SizedBox(
                        height: 0.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(bottom: 2.5.h),
                            // child: Image(
                            //   fit: BoxFit.cover,
                            //   color: Colors.white,
                            //   alignment: AlignmentDirectional.center,
                            //   height: 23.5.sp,
                            //   image: const AssetImage('assets/newImages/insurance.png',),
                            // ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          InkWell(
                              onTap: () async {

                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 62.w,
                                    child: Text(
                                      'privacy policy',
                                      style: TextStyle(

                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: .6.h,top: .6.h,right: .6.h,),
                                    child: SizedBox(
                                      width: 60.w,
                                      child: Text(
                                        'click',
                                        style: TextStyle(

                                            fontSize: 9.sp,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: mainScreenVm.widgetOptions.elementAt(mainScreenVm.selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(56.r)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
              icon: SvgPicture.asset(IconResources.notification,
                  color: Theme.of(context).textTheme.displayMedium?.color),
              label: 'Notification',
              activeIcon: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: ColorResources.brownDark,
                ),
                child: SvgPicture.asset(IconResources.notification,
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
    );

     */

  }
}

