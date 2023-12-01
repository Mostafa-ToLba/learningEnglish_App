import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_anglish_app/utils/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

// KEYS

String boardingScreensWatchedPrefKey = 'boarding_screens_Watched';
String choosingClassDonePrefKey = 'choosing_class_done';

String modePrefKey = 'mode';
String languagePrefKey = 'lang';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences sharedPreferences;
  SettingsBloc({required this.sharedPreferences})
      : super(SettingsState.initial()) {
    on<ChangeLanguage>((event, emit) {
      sharedPreferences.setString(
        languagePrefKey,
        event.changeLangTo,
      );
      emit(
        state.copyWith(locale: Locale(event.changeLangTo)),
      );
    });
    on<BoardingScreensWatched>((event, emit) {
      sharedPreferences.setBool(
        boardingScreensWatchedPrefKey,
        true,
      );
      emit(
        state.copyWith(areBoardingScreensWatched: true),
      );
    });
    on<ChoosingClassDone>((event, emit) {
      sharedPreferences.setBool(
        choosingClassDonePrefKey,
        true,
      );
      emit(
        state.copyWith(isChoosingClassDone: true),
      );
    });
    on<ChangeMode>((event, emit) {
      sharedPreferences.setInt(
        modePrefKey,
        event.appTheme.index,
      );
      emit(
        state.copyWith(mode: appThemeData[event.appTheme]!),
      );
    });
    on<CheckOnSettings>((event, emit) {
      String isLanguageSet = sharedPreferences.getString(languagePrefKey) ?? "";
      switch (isLanguageSet) {
        case '':
          final String defaultLocale = Platform.localeName;
          sharedPreferences.setString(languagePrefKey, defaultLocale);
          isLanguageSet = defaultLocale;
          break;
        default:
          break;
      }
      int isModeSet = sharedPreferences.getInt(modePrefKey) ?? 0;
      AppTheme appTheme = AppTheme.light;
      switch (isModeSet) {
        case 1:
          appTheme = AppTheme.dark;
          break;
        default:
          /*
          sharedPreferences.setInt('mode',
              appThemeData.containsValue(state.mode) ? 0 : 1 /*state.mode*/);
          */
          sharedPreferences.setInt(modePrefKey, 0);
      }
      final bool choosingClassDone =
          sharedPreferences.getBool(choosingClassDonePrefKey) ?? false;
      final bool boardingScreensWatched =
          sharedPreferences.getBool(boardingScreensWatchedPrefKey) ?? false;

      emit(
        state.copyWith(
          locale: Locale(isLanguageSet),
          mode: appThemeData[appTheme]!,
          areBoardingScreensWatched: boardingScreensWatched,
          isChoosingClassDone: choosingClassDone,
        ),
      );
    });
  }
}
