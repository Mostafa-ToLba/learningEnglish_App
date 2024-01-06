import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/userProfile_vm/userProfile_vm.dart';
import 'package:learning_anglish_app/data/web_services/end_points.dart';
import 'package:learning_anglish_app/presentation/screens/registration/login_screen/login_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/confirmDialog/confirmDialog.dart';
import 'package:learning_anglish_app/presentation/widgets/phoneTextField/phoneTextField.dart';
import 'package:learning_anglish_app/presentation/widgets/profileTextField/profileTextField.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({super.key});

  @override
  State<ProfileSettingsView> createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends State<ProfileSettingsView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.read<UserProfileViewModel>().imageFile = null;
   //   context.read<UserProfileViewModel>().getUserProfile();
    });
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2), // Animation duration (2 seconds in this example)
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start position (bottom of the screen)
      end: const Offset(0.0, 0.0), // End position (original position)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn, // Adjust the curve as needed
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<UserProfileViewModel>(
        builder: (BuildContext context, model, Widget? child) {
          return Column(
            children: [
              ProfileHeader(
                coverImageColor: ColorResources.buttonColor,
                avatar:
                'https://imgs.search.brave.com/56g8QfAqZ3wo8_Mz6y8bGT4Wi8heVdsTraSdeC3ifrc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wdWIt/c3RhdGljLmZvdG9y/LmNvbS9hc3NldHMv/cHJvamVjdHMvcGFn/ZXMvYmMzOTJiM2Jk/OGUzNDIyY2JiNjEx/OGQ3OGU2Zjc3YmUv/Zm90b3ItYzVkMmVk/NjIyMWFhNGQxOWE2/ZjY4NjZhYmU2Yzdh/NTAuanBn',
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20.h, right: 24.w, left: 24.w),
                  //padding: EdgeInsets.all(16.dg),
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "الأسم",
                          style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16.sp,
                            color: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .color
                                ?.withOpacity(0.6499999761581421),
                            //color: Theme.of(context).primaryColor,
                            // color: ColorResources.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomProfileTextField(hintText: 'Your name',hintColor:Colors.grey[500],
                        controller: model.nameController,readOnly: false,
                      ),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "البريد الالكتروني",
                          style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16.sp,
                            color: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .color
                                ?.withOpacity(0.6499999761581421),
                            //color: Theme.of(context).primaryColor,
                            // color: ColorResources.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomProfileTextField(hintText: 'Your email',hintColor:Colors.grey[500],
                        controller: model.emailController,readOnly: false,
                      ),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'رقم الهاتف',
                          style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16.sp,
                            color: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .color
                                ?.withOpacity(0.6499999761581421),
                            //color: Theme.of(context).primaryColor,
                            // color: ColorResources.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomPhoneTextField(hintText: '1023223332',hintColor: Colors.grey[500],textColor: Colors.black,
                      controller: model.phoneController,readOnly: false,
                      ),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "رقم ولي الأمر",
                          style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16.sp,
                            color: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .color
                                ?.withOpacity(0.6499999761581421),
                            //color: Theme.of(context).primaryColor,
                            // color: ColorResources.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomPhoneTextField(hintText: '1023223332',hintColor: Colors.grey[500],textColor: Colors.black,
                        controller: model.parentPhoneController,
                        readOnly: false,
                      ),
                      SizedBox(height: 25.h),
                      SlideTransition(
                        position: _offsetAnimation,
                        child: CustomButton(
                          widgetInCenter: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 10.w),
                                CustomText(
                                  text: 'Edit Profile',
                                  textAlign: TextAlign.center,
                                  color: Colors.white,
                                  txtSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(width: 10.w),
                                SvgPicture.asset(
                                  fit: BoxFit.scaleDown,
                                  IconResources.lock,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          color: ColorResources.buttonColor,
                          onTap: () {
                     //       model.updateUserProfile(context: context);
                            /*
                            ShowCustomDialog(context: context,
                              content: Padding(
                                padding: EdgeInsets.all(16.0.r),
                                child: StatefulBuilder(
                                    builder: (context, newSetState) {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Text(
                                              'هل ترغب في تحديث ملفك الشخصي؟',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 24.0),
                                            ),
                                            const SizedBox(height: 20.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Add your update profile logic here
                                                    print('تم تحديث الملف الشخصي بنجاح.');
                                                    // You can navigate to the profile update screen or perform necessary actions
                                                  },
                                                  child: const Text('تحديث'),
                                                ),
                                                const SizedBox(width: 20.0),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Add your cancel update logic here
                                                    print('تم إلغاء التحديث.');
                                                    // You can navigate back or perform any other cancel action
                                                  },
                                                  child: const Text('إلغاء'),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                ),
                              ),
                            ).showCustomDialg();

                             */
                          //  showUpdateProfileDialogg(context);

                            ConfirmCustomDialog(title: 'تحديث الملف الشخصي',
                            title2: 'هل ترغب حقا في تحديث ملفك الشخصي؟',
                            buttonText: 'تحديث',onTabPressed: model.updateUserProfile).showUpdateProfileDialogg(context);
                          },
                        ),
                      ),
                      SizedBox(height: 4.h),
                      TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "log_out".i18n(),
                              //textAlign: TextAlign.justify,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                fontSize: 16.sp,
                                color: ColorResources.red,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.logout,
                              color: ColorResources.red,
                              size: 16.sp,
                            ),
                          ],
                        ),
                        onPressed: () {
                          model.signOut(context: context).then((value)
                          {
                            Route route = MaterialPageRoute(
                                builder: (context) => const LoginScreen());
                            Navigator.pushReplacement(context, route);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProfileHeader extends StatefulWidget {
  final Color coverImageColor;
  final String avatar;

  const ProfileHeader({
    super.key,
    required this.coverImageColor,
    required this.avatar,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  late AnimationController animationControllerToCircular;
  late Animation<double> animationToCircular;
  @override
  void initState() {
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    // Define the animation curve
    final curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Define the animation
    _animation = Tween<double>(begin: 0, end: 1).animate(curve);

    // Start the animation
    _animationController.forward();

    /// circulara avatar animations
    // Initialize the animation controller
    animationControllerToCircular = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Define the animation curve
    final curvedCircularAvatar = CurvedAnimation(
      parent: animationControllerToCircular,
      curve: Curves.easeInOut,
    );

    // Define the animation
    animationToCircular = Tween<double>(begin: 1, end: 0).animate(curvedCircularAvatar);

    // Start the animation
    animationControllerToCircular.forward();
    ///
    super.initState();
  }
  @override
  void dispose() {
    // Dispose the animation controller
    _animationController.dispose();
    animationControllerToCircular.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Stack(
        children: <Widget>[
          Container(
            height: 120.h,
            color: widget.coverImageColor,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              children: <Widget>[
              AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animationController.value, // Scales from 0 to 1
                  child: Avatar(
                    image: widget.avatar,
                    radius: 60.r, // Set your desired initial size
                    iconBackgroudColor: widget.coverImageColor,
                  ),
                );
              },
            ),
                // SlideTransition(
                //   position: Tween<Offset>(
                //     begin: const Offset(0.0, 1.0), // Starts from the bottom
                //     end: Offset.zero,
                //   ).animate(CurvedAnimation(
                //     parent: _animationController,
                //     curve: Curves.easeInOut,
                //   )),
                //   child: Avatar(
                //     image: widget.avatar,
                //     radius: 60.r,
                //     iconBackgroudColor: widget.coverImageColor,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final String image;
  final double radius;
  final Color iconBackgroudColor;
  const Avatar({
    super.key,
    required this.image,
    required this.radius,
    required this.iconBackgroudColor,
  });

  @override
  Widget build(BuildContext context) {
    final profileVm = Provider.of<UserProfileViewModel>(context);
    return Stack(
      children: [
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
                          image: profileVm.imageFile !=null ? FileImage(profileVm.imageFile!)
                        as ImageProvider<Object>:NetworkImage(profileVm.image==''?image:EndPoints.imagesUrl+profileVm.image,),),
                      )// Display the profile image
                    ),
                  ),
                );
              },
            );
          },
          child: CircleAvatar(
            radius: radius,
            backgroundImage:profileVm.imageFile !=null ? FileImage(profileVm.imageFile!)
            as ImageProvider<Object>:NetworkImage(profileVm.image==''?image:EndPoints.imagesUrl+profileVm.image,),
          ),
        ),
        Positioned(
          bottom: 6.h,
          left: 6.w,
          child: InkWell(
            onTap: ()
            {
              profileVm.pickAndConvertImage();
            },
            child: Container(
              height: 28.h,
              width: 28.w,
              decoration: ShapeDecoration(
                color: ColorResources.brownDark,
                shape: const OvalBorder(),
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 14.dg,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


