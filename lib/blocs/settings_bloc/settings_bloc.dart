import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences sharedPreferences;
  SettingsBloc({required this.sharedPreferences})
      : super(SettingsState.initial()) {
    on<ChangeLanguage>((event, emit) {
      sharedPreferences.setString(
        'lang',
        json.encode(event.changeLangTo),
      );
      emit(
        state.copyWith(locale: Locale(event.changeLangTo)),
      );
    });
    on<ChangeMode>((event, emit) {
      // TODO: implement event handler
    });
    on<CheckOnSettings>((event, emit) {
      final isLanguageSet = (sharedPreferences.getString('lang') ?? '');
      if (isLanguageSet != '') {
      } else {
         //TODO: CHANGE IT TO DEVICE LOCALE
        //Locale locale = Locale(event.changeLangTo);
        sharedPreferences.setString('lang', state.locale.languageCode);
      }
      /*
      emit(
        state.copyWith(locale: locale),
      );
      */
    });
  }
}
