import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_anglish_app/blocs/settings_bloc/settings_bloc.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';

class AppDrawer extends StatelessWidget {
  final bool mode;
  final VoidCallback onExitPressed;
  const AppDrawer({
    super.key,
    required this.mode,
    required this.onExitPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorResources.drawerBackground,
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        width: 200.w,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(width: 32.w),
              //TODO: Maybe add internet connection here
              /*
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.power_settings_new,
                  ),
                  onPressed: () {},
                ),
              ),
              */
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 24.dg,
                    color: ColorResources.white1,
                  ),
                  onPressed: onExitPressed,
                ),
              ),

              SizedBox(height: 64.h),
              _buildRow(
                FontAwesomeIcons.moon,
                mode ? "light_mode".i18n() : "dark_mode".i18n(),
                () {
                  context
                      .read<SettingsBloc>()
                      .add(SettingsEvent.changeMode(!mode));
                },
              ),
              SizedBox(height: 48.h),
              _buildRow(
                FontAwesomeIcons.whatsapp,
                "contact_us".i18n(),
                () {},
              ),
              SizedBox(height: 48.h),

              _buildRow(
                FontAwesomeIcons.googlePlay,
                "rate_us".i18n(),
                () {},
              ),
              SizedBox(height: 48.h),
              _buildRow(
                FontAwesomeIcons.gear,
                "settings".i18n(),
                () {},
              ),
              SizedBox(height: 48.h),
              _buildRow(
                FontAwesomeIcons.circleQuestion,
                "help".i18n(),
                () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            SizedBox(width: 24.w),
            FaIcon(
              icon,
              size: 24.dg,
              color: ColorResources.white1,
            ),
            SizedBox(width: 10.w),
            Text(
              title.i18n(),
              style: TextStyle(
                color: ColorResources.white1,
                fontSize: 16.h,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
