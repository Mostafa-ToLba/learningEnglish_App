part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required bool mode,
    required Locale locale,
    required bool areBoardingScreensWatched,
    required bool isChoosingClassDone,
  }) = _SettingsState;

  factory SettingsState.initial() => const SettingsState(
        mode: false, // .containsKey(AppTheme.light),
        locale: Locale("en"), //TODO: CHANGE IT TO DEVICE LOCALE
        areBoardingScreensWatched: false,
        isChoosingClassDone: false,
      );
}
