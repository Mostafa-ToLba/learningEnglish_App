// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String changeLangTo) changeLanguage,
    required TResult Function() changeMode,
    required TResult Function() checkOnSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String changeLangTo)? changeLanguage,
    TResult? Function()? changeMode,
    TResult? Function()? checkOnSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String changeLangTo)? changeLanguage,
    TResult Function()? changeMode,
    TResult Function()? checkOnSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeLanguage value) changeLanguage,
    required TResult Function(ChangeMode value) changeMode,
    required TResult Function(CheckOnSettings value) checkOnSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeLanguage value)? changeLanguage,
    TResult? Function(ChangeMode value)? changeMode,
    TResult? Function(CheckOnSettings value)? checkOnSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeLanguage value)? changeLanguage,
    TResult Function(ChangeMode value)? changeMode,
    TResult Function(CheckOnSettings value)? checkOnSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChangeLanguageImplCopyWith<$Res> {
  factory _$$ChangeLanguageImplCopyWith(_$ChangeLanguageImpl value,
          $Res Function(_$ChangeLanguageImpl) then) =
      __$$ChangeLanguageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String changeLangTo});
}

/// @nodoc
class __$$ChangeLanguageImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$ChangeLanguageImpl>
    implements _$$ChangeLanguageImplCopyWith<$Res> {
  __$$ChangeLanguageImplCopyWithImpl(
      _$ChangeLanguageImpl _value, $Res Function(_$ChangeLanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? changeLangTo = null,
  }) {
    return _then(_$ChangeLanguageImpl(
      null == changeLangTo
          ? _value.changeLangTo
          : changeLangTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeLanguageImpl implements ChangeLanguage {
  const _$ChangeLanguageImpl(this.changeLangTo);

  @override
  final String changeLangTo;

  @override
  String toString() {
    return 'SettingsEvent.changeLanguage(changeLangTo: $changeLangTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLanguageImpl &&
            (identical(other.changeLangTo, changeLangTo) ||
                other.changeLangTo == changeLangTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, changeLangTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeLanguageImplCopyWith<_$ChangeLanguageImpl> get copyWith =>
      __$$ChangeLanguageImplCopyWithImpl<_$ChangeLanguageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String changeLangTo) changeLanguage,
    required TResult Function() changeMode,
    required TResult Function() checkOnSettings,
  }) {
    return changeLanguage(changeLangTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String changeLangTo)? changeLanguage,
    TResult? Function()? changeMode,
    TResult? Function()? checkOnSettings,
  }) {
    return changeLanguage?.call(changeLangTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String changeLangTo)? changeLanguage,
    TResult Function()? changeMode,
    TResult Function()? checkOnSettings,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(changeLangTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeLanguage value) changeLanguage,
    required TResult Function(ChangeMode value) changeMode,
    required TResult Function(CheckOnSettings value) checkOnSettings,
  }) {
    return changeLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeLanguage value)? changeLanguage,
    TResult? Function(ChangeMode value)? changeMode,
    TResult? Function(CheckOnSettings value)? checkOnSettings,
  }) {
    return changeLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeLanguage value)? changeLanguage,
    TResult Function(ChangeMode value)? changeMode,
    TResult Function(CheckOnSettings value)? checkOnSettings,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(this);
    }
    return orElse();
  }
}

abstract class ChangeLanguage implements SettingsEvent {
  const factory ChangeLanguage(final String changeLangTo) =
      _$ChangeLanguageImpl;

  String get changeLangTo;
  @JsonKey(ignore: true)
  _$$ChangeLanguageImplCopyWith<_$ChangeLanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeModeImplCopyWith<$Res> {
  factory _$$ChangeModeImplCopyWith(
          _$ChangeModeImpl value, $Res Function(_$ChangeModeImpl) then) =
      __$$ChangeModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeModeImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$ChangeModeImpl>
    implements _$$ChangeModeImplCopyWith<$Res> {
  __$$ChangeModeImplCopyWithImpl(
      _$ChangeModeImpl _value, $Res Function(_$ChangeModeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeModeImpl implements ChangeMode {
  const _$ChangeModeImpl();

  @override
  String toString() {
    return 'SettingsEvent.changeMode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String changeLangTo) changeLanguage,
    required TResult Function() changeMode,
    required TResult Function() checkOnSettings,
  }) {
    return changeMode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String changeLangTo)? changeLanguage,
    TResult? Function()? changeMode,
    TResult? Function()? checkOnSettings,
  }) {
    return changeMode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String changeLangTo)? changeLanguage,
    TResult Function()? changeMode,
    TResult Function()? checkOnSettings,
    required TResult orElse(),
  }) {
    if (changeMode != null) {
      return changeMode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeLanguage value) changeLanguage,
    required TResult Function(ChangeMode value) changeMode,
    required TResult Function(CheckOnSettings value) checkOnSettings,
  }) {
    return changeMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeLanguage value)? changeLanguage,
    TResult? Function(ChangeMode value)? changeMode,
    TResult? Function(CheckOnSettings value)? checkOnSettings,
  }) {
    return changeMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeLanguage value)? changeLanguage,
    TResult Function(ChangeMode value)? changeMode,
    TResult Function(CheckOnSettings value)? checkOnSettings,
    required TResult orElse(),
  }) {
    if (changeMode != null) {
      return changeMode(this);
    }
    return orElse();
  }
}

abstract class ChangeMode implements SettingsEvent {
  const factory ChangeMode() = _$ChangeModeImpl;
}

/// @nodoc
abstract class _$$CheckOnSettingsImplCopyWith<$Res> {
  factory _$$CheckOnSettingsImplCopyWith(_$CheckOnSettingsImpl value,
          $Res Function(_$CheckOnSettingsImpl) then) =
      __$$CheckOnSettingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckOnSettingsImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$CheckOnSettingsImpl>
    implements _$$CheckOnSettingsImplCopyWith<$Res> {
  __$$CheckOnSettingsImplCopyWithImpl(
      _$CheckOnSettingsImpl _value, $Res Function(_$CheckOnSettingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckOnSettingsImpl implements CheckOnSettings {
  const _$CheckOnSettingsImpl();

  @override
  String toString() {
    return 'SettingsEvent.checkOnSettings()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckOnSettingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String changeLangTo) changeLanguage,
    required TResult Function() changeMode,
    required TResult Function() checkOnSettings,
  }) {
    return checkOnSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String changeLangTo)? changeLanguage,
    TResult? Function()? changeMode,
    TResult? Function()? checkOnSettings,
  }) {
    return checkOnSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String changeLangTo)? changeLanguage,
    TResult Function()? changeMode,
    TResult Function()? checkOnSettings,
    required TResult orElse(),
  }) {
    if (checkOnSettings != null) {
      return checkOnSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeLanguage value) changeLanguage,
    required TResult Function(ChangeMode value) changeMode,
    required TResult Function(CheckOnSettings value) checkOnSettings,
  }) {
    return checkOnSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeLanguage value)? changeLanguage,
    TResult? Function(ChangeMode value)? changeMode,
    TResult? Function(CheckOnSettings value)? checkOnSettings,
  }) {
    return checkOnSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeLanguage value)? changeLanguage,
    TResult Function(ChangeMode value)? changeMode,
    TResult Function(CheckOnSettings value)? checkOnSettings,
    required TResult orElse(),
  }) {
    if (checkOnSettings != null) {
      return checkOnSettings(this);
    }
    return orElse();
  }
}

abstract class CheckOnSettings implements SettingsEvent {
  const factory CheckOnSettings() = _$CheckOnSettingsImpl;
}

/// @nodoc
mixin _$SettingsState {
  Mode get mode => throw _privateConstructorUsedError;
  Locale get locale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({Mode mode, Locale locale});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Mode,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Mode mode, Locale locale});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? locale = null,
  }) {
    return _then(_$SettingsStateImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Mode,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl({required this.mode, required this.locale});

  @override
  final Mode mode;
  @override
  final Locale locale;

  @override
  String toString() {
    return 'SettingsState(mode: $mode, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {required final Mode mode,
      required final Locale locale}) = _$SettingsStateImpl;

  @override
  Mode get mode;
  @override
  Locale get locale;
  @override
  @JsonKey(ignore: true)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
