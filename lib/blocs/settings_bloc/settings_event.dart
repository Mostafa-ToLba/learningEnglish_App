part of 'settings_bloc.dart';
@freezed
class SettingsEvent with _$SettingsEvent{
	const factory SettingsEvent.changeLanguage(String changeLangTo) = ChangeLanguage;
	const factory SettingsEvent.changeMode() = ChangeMode;
	const factory SettingsEvent.checkOnSettings() = CheckOnSettings;
}
