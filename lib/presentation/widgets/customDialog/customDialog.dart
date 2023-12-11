import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/injection.dart';
import 'package:provider/provider.dart';

class ShowCustomDialog {
  final BuildContext context;
  final Widget? content;
  final bool isTransparent;
  ShowCustomDialog({
    required this.context,
    this.content,
    this.isTransparent = false,
  });
  Future showCustomDialg() async {
    final isDark = Provider.of<ThemesViewModel>(context).isDark;
    showGeneralDialog(
        context: context,
        barrierLabel: "Label",
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 300),
        // useRootNavigator: false,
        // barrierColor: Colors.grey.withOpacity(0.2),
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        },
        pageBuilder: (context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Dialog(
            elevation: isTransparent ? 0 : null,
            backgroundColor: isTransparent
                ? Colors.transparent
                : isDark == true
                    ? Colors.black
                    : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            alignment: Alignment.center,
            child: content,
          );
        });
  }
}
