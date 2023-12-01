part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required ThemeData mode,
    required Locale locale,
    required bool areBoardingScreensWatched,
    required bool isChoosingClassDone,
  }) = _SettingsState;

  factory SettingsState.initial() => SettingsState(
        mode: appThemeData[AppTheme.light]! ,// .containsKey(AppTheme.light),
        locale: const Locale("en"), //TODO: CHANGE IT TO DEVICE LOCALE
        areBoardingScreensWatched: false,
        isChoosingClassDone: false,
      );
}
