import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/notification/notification_model.dart';
import 'package:logger/logger.dart';

class NotificationViewModel extends BaseNotifier {
  final List<Color> colors = const [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.grey,
    Colors.indigo,
    Colors.yellowAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
    Colors.black,
    Colors.white10,
  ];

  NotificationModel? notificationModel;
  void getNotification() async {
    setBusy();
    try {
      Response<dynamic> res = await api.notifications();
      notificationModel = NotificationModel.fromJson(res.data);
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  String formatTimestampForArabic({time}) {
  //  DateTime dateTime = timestamp.toDate();
    Duration difference = DateTime.now().difference(time);
    if (difference.inDays > 1) {
      return Intl.plural(
        difference.inDays,
        zero: 'اليوم',
        one: 'قبل يوم واحد',
        two: 'قبل يومين',
        few: 'قبل ${difference.inDays} أيام',
        many: 'قبل ${difference.inDays} يومًا',
        other: 'قبل ${difference.inDays} يومًا',
        locale: 'ar',
      );
    } else if (difference.inDays == 1) {
      return 'قبل يوم واحد';
    } else if (difference.inHours > 1) {
      return Intl.plural(
        difference.inHours,
        zero: 'الساعة الحالية',
        one: 'قبل ساعة واحدة',
        two: 'قبل ساعتين',
        few: 'قبل ${difference.inHours} ساعات',
        many: 'قبل ${difference.inHours} ساعة',
        other: 'قبل ${difference.inHours} ساعة',
        locale: 'ar',
      );
    } else if (difference.inHours == 1) {
      return 'قبل ساعة واحدة';
    } else if (difference.inMinutes > 1) {
      return Intl.plural(
        difference.inMinutes,
        zero: 'الدقيقة الحالية',
        one: 'قبل دقيقة واحدة',
        two: 'قبل دقيقتين',
        few: 'قبل ${difference.inMinutes} دقائق',
        many: 'قبل ${difference.inMinutes} دقيقة',
        other: 'قبل ${difference.inMinutes} دقيقة',
        locale: 'ar',
      );
    } else if (difference.inMinutes == 1) {
      return 'قبل دقيقة واحدة';
    } else {
      return 'الآن';
    }
  }


}
