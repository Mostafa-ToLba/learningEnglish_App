part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.changeLanguage(String changeLangTo) =
      ChangeLanguage;
  const factory SettingsEvent.changeMode(bool appTheme) = ChangeMode;
  const factory SettingsEvent.boardingScreensWatched() = BoardingScreensWatched;
  const factory SettingsEvent.choosingClassDone() = ChoosingClassDone;
  const factory SettingsEvent.checkOnSettings() = CheckOnSettings;
}
