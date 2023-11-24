part of 'settings_bloc.dart';

enum Mode { lightMode, darkMode }

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required Mode mode,
    required Locale locale,
  }) = _SettingsState;

  factory SettingsState.initial() => SettingsState(
        mode: Mode.lightMode,
        locale: Locale('en'),
      );
}
