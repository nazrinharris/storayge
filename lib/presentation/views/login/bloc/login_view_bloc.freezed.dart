// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginViewEventTearOff {
  const _$LoginViewEventTearOff();

  _LVEStarted started() {
    return const _LVEStarted();
  }

  _LVEIdle idle() {
    return const _LVEIdle();
  }

  _LVEContinuePressed continuePressed(
      {required dynamic Function() showInfoTile,
      required dynamic Function() hideInfoTile,
      required dynamic Function() doAfterSuccess,
      required dynamic Function() doAfterError,
      required dynamic Function(InfoTileProps) updateInfoTile,
      required dynamic Function() triggerLoadingPrimaryButtonAware,
      required dynamic Function() triggerFirstPrimaryButtonAware,
      required String email,
      required String password}) {
    return _LVEContinuePressed(
      showInfoTile: showInfoTile,
      hideInfoTile: hideInfoTile,
      doAfterSuccess: doAfterSuccess,
      doAfterError: doAfterError,
      updateInfoTile: updateInfoTile,
      triggerLoadingPrimaryButtonAware: triggerLoadingPrimaryButtonAware,
      triggerFirstPrimaryButtonAware: triggerFirstPrimaryButtonAware,
      email: email,
      password: password,
    );
  }

  _LVEToggleVisible toggleInfoTileVisibility() {
    return const _LVEToggleVisible();
  }
}

/// @nodoc
const $LoginViewEvent = _$LoginViewEventTearOff();

/// @nodoc
mixin _$LoginViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() idle,
    required TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)
        continuePressed,
    required TResult Function() toggleInfoTileVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? idle,
    TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)?
        continuePressed,
    TResult Function()? toggleInfoTileVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LVEStarted value) started,
    required TResult Function(_LVEIdle value) idle,
    required TResult Function(_LVEContinuePressed value) continuePressed,
    required TResult Function(_LVEToggleVisible value) toggleInfoTileVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LVEStarted value)? started,
    TResult Function(_LVEIdle value)? idle,
    TResult Function(_LVEContinuePressed value)? continuePressed,
    TResult Function(_LVEToggleVisible value)? toggleInfoTileVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginViewEventCopyWith<$Res> {
  factory $LoginViewEventCopyWith(
          LoginViewEvent value, $Res Function(LoginViewEvent) then) =
      _$LoginViewEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginViewEventCopyWithImpl<$Res>
    implements $LoginViewEventCopyWith<$Res> {
  _$LoginViewEventCopyWithImpl(this._value, this._then);

  final LoginViewEvent _value;
  // ignore: unused_field
  final $Res Function(LoginViewEvent) _then;
}

/// @nodoc
abstract class _$LVEStartedCopyWith<$Res> {
  factory _$LVEStartedCopyWith(
          _LVEStarted value, $Res Function(_LVEStarted) then) =
      __$LVEStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$LVEStartedCopyWithImpl<$Res> extends _$LoginViewEventCopyWithImpl<$Res>
    implements _$LVEStartedCopyWith<$Res> {
  __$LVEStartedCopyWithImpl(
      _LVEStarted _value, $Res Function(_LVEStarted) _then)
      : super(_value, (v) => _then(v as _LVEStarted));

  @override
  _LVEStarted get _value => super._value as _LVEStarted;
}

/// @nodoc

class _$_LVEStarted with DiagnosticableTreeMixin implements _LVEStarted {
  const _$_LVEStarted();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginViewEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoginViewEvent.started'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LVEStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() idle,
    required TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)
        continuePressed,
    required TResult Function() toggleInfoTileVisibility,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? idle,
    TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)?
        continuePressed,
    TResult Function()? toggleInfoTileVisibility,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LVEStarted value) started,
    required TResult Function(_LVEIdle value) idle,
    required TResult Function(_LVEContinuePressed value) continuePressed,
    required TResult Function(_LVEToggleVisible value) toggleInfoTileVisibility,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LVEStarted value)? started,
    TResult Function(_LVEIdle value)? idle,
    TResult Function(_LVEContinuePressed value)? continuePressed,
    TResult Function(_LVEToggleVisible value)? toggleInfoTileVisibility,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _LVEStarted implements LoginViewEvent {
  const factory _LVEStarted() = _$_LVEStarted;
}

/// @nodoc
abstract class _$LVEIdleCopyWith<$Res> {
  factory _$LVEIdleCopyWith(_LVEIdle value, $Res Function(_LVEIdle) then) =
      __$LVEIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$LVEIdleCopyWithImpl<$Res> extends _$LoginViewEventCopyWithImpl<$Res>
    implements _$LVEIdleCopyWith<$Res> {
  __$LVEIdleCopyWithImpl(_LVEIdle _value, $Res Function(_LVEIdle) _then)
      : super(_value, (v) => _then(v as _LVEIdle));

  @override
  _LVEIdle get _value => super._value as _LVEIdle;
}

/// @nodoc

class _$_LVEIdle with DiagnosticableTreeMixin implements _LVEIdle {
  const _$_LVEIdle();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginViewEvent.idle()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoginViewEvent.idle'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LVEIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() idle,
    required TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)
        continuePressed,
    required TResult Function() toggleInfoTileVisibility,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? idle,
    TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)?
        continuePressed,
    TResult Function()? toggleInfoTileVisibility,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LVEStarted value) started,
    required TResult Function(_LVEIdle value) idle,
    required TResult Function(_LVEContinuePressed value) continuePressed,
    required TResult Function(_LVEToggleVisible value) toggleInfoTileVisibility,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LVEStarted value)? started,
    TResult Function(_LVEIdle value)? idle,
    TResult Function(_LVEContinuePressed value)? continuePressed,
    TResult Function(_LVEToggleVisible value)? toggleInfoTileVisibility,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _LVEIdle implements LoginViewEvent {
  const factory _LVEIdle() = _$_LVEIdle;
}

/// @nodoc
abstract class _$LVEContinuePressedCopyWith<$Res> {
  factory _$LVEContinuePressedCopyWith(
          _LVEContinuePressed value, $Res Function(_LVEContinuePressed) then) =
      __$LVEContinuePressedCopyWithImpl<$Res>;
  $Res call(
      {dynamic Function() showInfoTile,
      dynamic Function() hideInfoTile,
      dynamic Function() doAfterSuccess,
      dynamic Function() doAfterError,
      dynamic Function(InfoTileProps) updateInfoTile,
      dynamic Function() triggerLoadingPrimaryButtonAware,
      dynamic Function() triggerFirstPrimaryButtonAware,
      String email,
      String password});
}

/// @nodoc
class __$LVEContinuePressedCopyWithImpl<$Res>
    extends _$LoginViewEventCopyWithImpl<$Res>
    implements _$LVEContinuePressedCopyWith<$Res> {
  __$LVEContinuePressedCopyWithImpl(
      _LVEContinuePressed _value, $Res Function(_LVEContinuePressed) _then)
      : super(_value, (v) => _then(v as _LVEContinuePressed));

  @override
  _LVEContinuePressed get _value => super._value as _LVEContinuePressed;

  @override
  $Res call({
    Object? showInfoTile = freezed,
    Object? hideInfoTile = freezed,
    Object? doAfterSuccess = freezed,
    Object? doAfterError = freezed,
    Object? updateInfoTile = freezed,
    Object? triggerLoadingPrimaryButtonAware = freezed,
    Object? triggerFirstPrimaryButtonAware = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_LVEContinuePressed(
      showInfoTile: showInfoTile == freezed
          ? _value.showInfoTile
          : showInfoTile // ignore: cast_nullable_to_non_nullable
              as dynamic Function(),
      hideInfoTile: hideInfoTile == freezed
          ? _value.hideInfoTile
          : hideInfoTile // ignore: cast_nullable_to_non_nullable
              as dynamic Function(),
      doAfterSuccess: doAfterSuccess == freezed
          ? _value.doAfterSuccess
          : doAfterSuccess // ignore: cast_nullable_to_non_nullable
              as dynamic Function(),
      doAfterError: doAfterError == freezed
          ? _value.doAfterError
          : doAfterError // ignore: cast_nullable_to_non_nullable
              as dynamic Function(),
      updateInfoTile: updateInfoTile == freezed
          ? _value.updateInfoTile
          : updateInfoTile // ignore: cast_nullable_to_non_nullable
              as dynamic Function(InfoTileProps),
      triggerLoadingPrimaryButtonAware: triggerLoadingPrimaryButtonAware ==
              freezed
          ? _value.triggerLoadingPrimaryButtonAware
          : triggerLoadingPrimaryButtonAware // ignore: cast_nullable_to_non_nullable
              as dynamic Function(),
      triggerFirstPrimaryButtonAware: triggerFirstPrimaryButtonAware == freezed
          ? _value.triggerFirstPrimaryButtonAware
          : triggerFirstPrimaryButtonAware // ignore: cast_nullable_to_non_nullable
              as dynamic Function(),
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LVEContinuePressed
    with DiagnosticableTreeMixin
    implements _LVEContinuePressed {
  const _$_LVEContinuePressed(
      {required this.showInfoTile,
      required this.hideInfoTile,
      required this.doAfterSuccess,
      required this.doAfterError,
      required this.updateInfoTile,
      required this.triggerLoadingPrimaryButtonAware,
      required this.triggerFirstPrimaryButtonAware,
      required this.email,
      required this.password});

  @override
  final dynamic Function() showInfoTile;
  @override
  final dynamic Function() hideInfoTile;
  @override
  final dynamic Function() doAfterSuccess;
  @override
  final dynamic Function() doAfterError;
  @override
  final dynamic Function(InfoTileProps) updateInfoTile;
  @override
  final dynamic Function() triggerLoadingPrimaryButtonAware;
  @override
  final dynamic Function() triggerFirstPrimaryButtonAware;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginViewEvent.continuePressed(showInfoTile: $showInfoTile, hideInfoTile: $hideInfoTile, doAfterSuccess: $doAfterSuccess, doAfterError: $doAfterError, updateInfoTile: $updateInfoTile, triggerLoadingPrimaryButtonAware: $triggerLoadingPrimaryButtonAware, triggerFirstPrimaryButtonAware: $triggerFirstPrimaryButtonAware, email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginViewEvent.continuePressed'))
      ..add(DiagnosticsProperty('showInfoTile', showInfoTile))
      ..add(DiagnosticsProperty('hideInfoTile', hideInfoTile))
      ..add(DiagnosticsProperty('doAfterSuccess', doAfterSuccess))
      ..add(DiagnosticsProperty('doAfterError', doAfterError))
      ..add(DiagnosticsProperty('updateInfoTile', updateInfoTile))
      ..add(DiagnosticsProperty(
          'triggerLoadingPrimaryButtonAware', triggerLoadingPrimaryButtonAware))
      ..add(DiagnosticsProperty(
          'triggerFirstPrimaryButtonAware', triggerFirstPrimaryButtonAware))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LVEContinuePressed &&
            (identical(other.showInfoTile, showInfoTile) ||
                const DeepCollectionEquality()
                    .equals(other.showInfoTile, showInfoTile)) &&
            (identical(other.hideInfoTile, hideInfoTile) ||
                const DeepCollectionEquality()
                    .equals(other.hideInfoTile, hideInfoTile)) &&
            (identical(other.doAfterSuccess, doAfterSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.doAfterSuccess, doAfterSuccess)) &&
            (identical(other.doAfterError, doAfterError) ||
                const DeepCollectionEquality()
                    .equals(other.doAfterError, doAfterError)) &&
            (identical(other.updateInfoTile, updateInfoTile) ||
                const DeepCollectionEquality()
                    .equals(other.updateInfoTile, updateInfoTile)) &&
            (identical(other.triggerLoadingPrimaryButtonAware,
                    triggerLoadingPrimaryButtonAware) ||
                const DeepCollectionEquality().equals(
                    other.triggerLoadingPrimaryButtonAware,
                    triggerLoadingPrimaryButtonAware)) &&
            (identical(other.triggerFirstPrimaryButtonAware,
                    triggerFirstPrimaryButtonAware) ||
                const DeepCollectionEquality().equals(
                    other.triggerFirstPrimaryButtonAware,
                    triggerFirstPrimaryButtonAware)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showInfoTile) ^
      const DeepCollectionEquality().hash(hideInfoTile) ^
      const DeepCollectionEquality().hash(doAfterSuccess) ^
      const DeepCollectionEquality().hash(doAfterError) ^
      const DeepCollectionEquality().hash(updateInfoTile) ^
      const DeepCollectionEquality().hash(triggerLoadingPrimaryButtonAware) ^
      const DeepCollectionEquality().hash(triggerFirstPrimaryButtonAware) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$LVEContinuePressedCopyWith<_LVEContinuePressed> get copyWith =>
      __$LVEContinuePressedCopyWithImpl<_LVEContinuePressed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() idle,
    required TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)
        continuePressed,
    required TResult Function() toggleInfoTileVisibility,
  }) {
    return continuePressed(
        showInfoTile,
        hideInfoTile,
        doAfterSuccess,
        doAfterError,
        updateInfoTile,
        triggerLoadingPrimaryButtonAware,
        triggerFirstPrimaryButtonAware,
        email,
        password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? idle,
    TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)?
        continuePressed,
    TResult Function()? toggleInfoTileVisibility,
    required TResult orElse(),
  }) {
    if (continuePressed != null) {
      return continuePressed(
          showInfoTile,
          hideInfoTile,
          doAfterSuccess,
          doAfterError,
          updateInfoTile,
          triggerLoadingPrimaryButtonAware,
          triggerFirstPrimaryButtonAware,
          email,
          password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LVEStarted value) started,
    required TResult Function(_LVEIdle value) idle,
    required TResult Function(_LVEContinuePressed value) continuePressed,
    required TResult Function(_LVEToggleVisible value) toggleInfoTileVisibility,
  }) {
    return continuePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LVEStarted value)? started,
    TResult Function(_LVEIdle value)? idle,
    TResult Function(_LVEContinuePressed value)? continuePressed,
    TResult Function(_LVEToggleVisible value)? toggleInfoTileVisibility,
    required TResult orElse(),
  }) {
    if (continuePressed != null) {
      return continuePressed(this);
    }
    return orElse();
  }
}

abstract class _LVEContinuePressed implements LoginViewEvent {
  const factory _LVEContinuePressed(
      {required dynamic Function() showInfoTile,
      required dynamic Function() hideInfoTile,
      required dynamic Function() doAfterSuccess,
      required dynamic Function() doAfterError,
      required dynamic Function(InfoTileProps) updateInfoTile,
      required dynamic Function() triggerLoadingPrimaryButtonAware,
      required dynamic Function() triggerFirstPrimaryButtonAware,
      required String email,
      required String password}) = _$_LVEContinuePressed;

  dynamic Function() get showInfoTile => throw _privateConstructorUsedError;
  dynamic Function() get hideInfoTile => throw _privateConstructorUsedError;
  dynamic Function() get doAfterSuccess => throw _privateConstructorUsedError;
  dynamic Function() get doAfterError => throw _privateConstructorUsedError;
  dynamic Function(InfoTileProps) get updateInfoTile =>
      throw _privateConstructorUsedError;
  dynamic Function() get triggerLoadingPrimaryButtonAware =>
      throw _privateConstructorUsedError;
  dynamic Function() get triggerFirstPrimaryButtonAware =>
      throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LVEContinuePressedCopyWith<_LVEContinuePressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LVEToggleVisibleCopyWith<$Res> {
  factory _$LVEToggleVisibleCopyWith(
          _LVEToggleVisible value, $Res Function(_LVEToggleVisible) then) =
      __$LVEToggleVisibleCopyWithImpl<$Res>;
}

/// @nodoc
class __$LVEToggleVisibleCopyWithImpl<$Res>
    extends _$LoginViewEventCopyWithImpl<$Res>
    implements _$LVEToggleVisibleCopyWith<$Res> {
  __$LVEToggleVisibleCopyWithImpl(
      _LVEToggleVisible _value, $Res Function(_LVEToggleVisible) _then)
      : super(_value, (v) => _then(v as _LVEToggleVisible));

  @override
  _LVEToggleVisible get _value => super._value as _LVEToggleVisible;
}

/// @nodoc

class _$_LVEToggleVisible
    with DiagnosticableTreeMixin
    implements _LVEToggleVisible {
  const _$_LVEToggleVisible();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginViewEvent.toggleInfoTileVisibility()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'LoginViewEvent.toggleInfoTileVisibility'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LVEToggleVisible);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() idle,
    required TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)
        continuePressed,
    required TResult Function() toggleInfoTileVisibility,
  }) {
    return toggleInfoTileVisibility();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? idle,
    TResult Function(
            dynamic Function() showInfoTile,
            dynamic Function() hideInfoTile,
            dynamic Function() doAfterSuccess,
            dynamic Function() doAfterError,
            dynamic Function(InfoTileProps) updateInfoTile,
            dynamic Function() triggerLoadingPrimaryButtonAware,
            dynamic Function() triggerFirstPrimaryButtonAware,
            String email,
            String password)?
        continuePressed,
    TResult Function()? toggleInfoTileVisibility,
    required TResult orElse(),
  }) {
    if (toggleInfoTileVisibility != null) {
      return toggleInfoTileVisibility();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LVEStarted value) started,
    required TResult Function(_LVEIdle value) idle,
    required TResult Function(_LVEContinuePressed value) continuePressed,
    required TResult Function(_LVEToggleVisible value) toggleInfoTileVisibility,
  }) {
    return toggleInfoTileVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LVEStarted value)? started,
    TResult Function(_LVEIdle value)? idle,
    TResult Function(_LVEContinuePressed value)? continuePressed,
    TResult Function(_LVEToggleVisible value)? toggleInfoTileVisibility,
    required TResult orElse(),
  }) {
    if (toggleInfoTileVisibility != null) {
      return toggleInfoTileVisibility(this);
    }
    return orElse();
  }
}

abstract class _LVEToggleVisible implements LoginViewEvent {
  const factory _LVEToggleVisible() = _$_LVEToggleVisible;
}

/// @nodoc
class _$LoginViewStateTearOff {
  const _$LoginViewStateTearOff();

  _LVSInitial initial(LoginViewProps loginViewProps) {
    return _LVSInitial(
      loginViewProps,
    );
  }

  _LVSLoading loading(LoginViewProps loginViewProps) {
    return _LVSLoading(
      loginViewProps,
    );
  }

  _LVSIdle idle(LoginViewProps loginViewProps) {
    return _LVSIdle(
      loginViewProps,
    );
  }
}

/// @nodoc
const $LoginViewState = _$LoginViewStateTearOff();

/// @nodoc
mixin _$LoginViewState {
  LoginViewProps get loginViewProps => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginViewProps loginViewProps) initial,
    required TResult Function(LoginViewProps loginViewProps) loading,
    required TResult Function(LoginViewProps loginViewProps) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginViewProps loginViewProps)? initial,
    TResult Function(LoginViewProps loginViewProps)? loading,
    TResult Function(LoginViewProps loginViewProps)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LVSInitial value) initial,
    required TResult Function(_LVSLoading value) loading,
    required TResult Function(_LVSIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LVSInitial value)? initial,
    TResult Function(_LVSLoading value)? loading,
    TResult Function(_LVSIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginViewStateCopyWith<LoginViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginViewStateCopyWith<$Res> {
  factory $LoginViewStateCopyWith(
          LoginViewState value, $Res Function(LoginViewState) then) =
      _$LoginViewStateCopyWithImpl<$Res>;
  $Res call({LoginViewProps loginViewProps});

  $LoginViewPropsCopyWith<$Res> get loginViewProps;
}

/// @nodoc
class _$LoginViewStateCopyWithImpl<$Res>
    implements $LoginViewStateCopyWith<$Res> {
  _$LoginViewStateCopyWithImpl(this._value, this._then);

  final LoginViewState _value;
  // ignore: unused_field
  final $Res Function(LoginViewState) _then;

  @override
  $Res call({
    Object? loginViewProps = freezed,
  }) {
    return _then(_value.copyWith(
      loginViewProps: loginViewProps == freezed
          ? _value.loginViewProps
          : loginViewProps // ignore: cast_nullable_to_non_nullable
              as LoginViewProps,
    ));
  }

  @override
  $LoginViewPropsCopyWith<$Res> get loginViewProps {
    return $LoginViewPropsCopyWith<$Res>(_value.loginViewProps, (value) {
      return _then(_value.copyWith(loginViewProps: value));
    });
  }
}

/// @nodoc
abstract class _$LVSInitialCopyWith<$Res>
    implements $LoginViewStateCopyWith<$Res> {
  factory _$LVSInitialCopyWith(
          _LVSInitial value, $Res Function(_LVSInitial) then) =
      __$LVSInitialCopyWithImpl<$Res>;
  @override
  $Res call({LoginViewProps loginViewProps});

  @override
  $LoginViewPropsCopyWith<$Res> get loginViewProps;
}

/// @nodoc
class __$LVSInitialCopyWithImpl<$Res> extends _$LoginViewStateCopyWithImpl<$Res>
    implements _$LVSInitialCopyWith<$Res> {
  __$LVSInitialCopyWithImpl(
      _LVSInitial _value, $Res Function(_LVSInitial) _then)
      : super(_value, (v) => _then(v as _LVSInitial));

  @override
  _LVSInitial get _value => super._value as _LVSInitial;

  @override
  $Res call({
    Object? loginViewProps = freezed,
  }) {
    return _then(_LVSInitial(
      loginViewProps == freezed
          ? _value.loginViewProps
          : loginViewProps // ignore: cast_nullable_to_non_nullable
              as LoginViewProps,
    ));
  }
}

/// @nodoc

class _$_LVSInitial with DiagnosticableTreeMixin implements _LVSInitial {
  const _$_LVSInitial(this.loginViewProps);

  @override
  final LoginViewProps loginViewProps;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginViewState.initial(loginViewProps: $loginViewProps)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginViewState.initial'))
      ..add(DiagnosticsProperty('loginViewProps', loginViewProps));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LVSInitial &&
            (identical(other.loginViewProps, loginViewProps) ||
                const DeepCollectionEquality()
                    .equals(other.loginViewProps, loginViewProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loginViewProps);

  @JsonKey(ignore: true)
  @override
  _$LVSInitialCopyWith<_LVSInitial> get copyWith =>
      __$LVSInitialCopyWithImpl<_LVSInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginViewProps loginViewProps) initial,
    required TResult Function(LoginViewProps loginViewProps) loading,
    required TResult Function(LoginViewProps loginViewProps) idle,
  }) {
    return initial(loginViewProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginViewProps loginViewProps)? initial,
    TResult Function(LoginViewProps loginViewProps)? loading,
    TResult Function(LoginViewProps loginViewProps)? idle,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(loginViewProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LVSInitial value) initial,
    required TResult Function(_LVSLoading value) loading,
    required TResult Function(_LVSIdle value) idle,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LVSInitial value)? initial,
    TResult Function(_LVSLoading value)? loading,
    TResult Function(_LVSIdle value)? idle,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _LVSInitial implements LoginViewState {
  const factory _LVSInitial(LoginViewProps loginViewProps) = _$_LVSInitial;

  @override
  LoginViewProps get loginViewProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LVSInitialCopyWith<_LVSInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LVSLoadingCopyWith<$Res>
    implements $LoginViewStateCopyWith<$Res> {
  factory _$LVSLoadingCopyWith(
          _LVSLoading value, $Res Function(_LVSLoading) then) =
      __$LVSLoadingCopyWithImpl<$Res>;
  @override
  $Res call({LoginViewProps loginViewProps});

  @override
  $LoginViewPropsCopyWith<$Res> get loginViewProps;
}

/// @nodoc
class __$LVSLoadingCopyWithImpl<$Res> extends _$LoginViewStateCopyWithImpl<$Res>
    implements _$LVSLoadingCopyWith<$Res> {
  __$LVSLoadingCopyWithImpl(
      _LVSLoading _value, $Res Function(_LVSLoading) _then)
      : super(_value, (v) => _then(v as _LVSLoading));

  @override
  _LVSLoading get _value => super._value as _LVSLoading;

  @override
  $Res call({
    Object? loginViewProps = freezed,
  }) {
    return _then(_LVSLoading(
      loginViewProps == freezed
          ? _value.loginViewProps
          : loginViewProps // ignore: cast_nullable_to_non_nullable
              as LoginViewProps,
    ));
  }
}

/// @nodoc

class _$_LVSLoading with DiagnosticableTreeMixin implements _LVSLoading {
  const _$_LVSLoading(this.loginViewProps);

  @override
  final LoginViewProps loginViewProps;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginViewState.loading(loginViewProps: $loginViewProps)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginViewState.loading'))
      ..add(DiagnosticsProperty('loginViewProps', loginViewProps));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LVSLoading &&
            (identical(other.loginViewProps, loginViewProps) ||
                const DeepCollectionEquality()
                    .equals(other.loginViewProps, loginViewProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loginViewProps);

  @JsonKey(ignore: true)
  @override
  _$LVSLoadingCopyWith<_LVSLoading> get copyWith =>
      __$LVSLoadingCopyWithImpl<_LVSLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginViewProps loginViewProps) initial,
    required TResult Function(LoginViewProps loginViewProps) loading,
    required TResult Function(LoginViewProps loginViewProps) idle,
  }) {
    return loading(loginViewProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginViewProps loginViewProps)? initial,
    TResult Function(LoginViewProps loginViewProps)? loading,
    TResult Function(LoginViewProps loginViewProps)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(loginViewProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LVSInitial value) initial,
    required TResult Function(_LVSLoading value) loading,
    required TResult Function(_LVSIdle value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LVSInitial value)? initial,
    TResult Function(_LVSLoading value)? loading,
    TResult Function(_LVSIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LVSLoading implements LoginViewState {
  const factory _LVSLoading(LoginViewProps loginViewProps) = _$_LVSLoading;

  @override
  LoginViewProps get loginViewProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LVSLoadingCopyWith<_LVSLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LVSIdleCopyWith<$Res>
    implements $LoginViewStateCopyWith<$Res> {
  factory _$LVSIdleCopyWith(_LVSIdle value, $Res Function(_LVSIdle) then) =
      __$LVSIdleCopyWithImpl<$Res>;
  @override
  $Res call({LoginViewProps loginViewProps});

  @override
  $LoginViewPropsCopyWith<$Res> get loginViewProps;
}

/// @nodoc
class __$LVSIdleCopyWithImpl<$Res> extends _$LoginViewStateCopyWithImpl<$Res>
    implements _$LVSIdleCopyWith<$Res> {
  __$LVSIdleCopyWithImpl(_LVSIdle _value, $Res Function(_LVSIdle) _then)
      : super(_value, (v) => _then(v as _LVSIdle));

  @override
  _LVSIdle get _value => super._value as _LVSIdle;

  @override
  $Res call({
    Object? loginViewProps = freezed,
  }) {
    return _then(_LVSIdle(
      loginViewProps == freezed
          ? _value.loginViewProps
          : loginViewProps // ignore: cast_nullable_to_non_nullable
              as LoginViewProps,
    ));
  }
}

/// @nodoc

class _$_LVSIdle with DiagnosticableTreeMixin implements _LVSIdle {
  const _$_LVSIdle(this.loginViewProps);

  @override
  final LoginViewProps loginViewProps;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginViewState.idle(loginViewProps: $loginViewProps)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginViewState.idle'))
      ..add(DiagnosticsProperty('loginViewProps', loginViewProps));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LVSIdle &&
            (identical(other.loginViewProps, loginViewProps) ||
                const DeepCollectionEquality()
                    .equals(other.loginViewProps, loginViewProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loginViewProps);

  @JsonKey(ignore: true)
  @override
  _$LVSIdleCopyWith<_LVSIdle> get copyWith =>
      __$LVSIdleCopyWithImpl<_LVSIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginViewProps loginViewProps) initial,
    required TResult Function(LoginViewProps loginViewProps) loading,
    required TResult Function(LoginViewProps loginViewProps) idle,
  }) {
    return idle(loginViewProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginViewProps loginViewProps)? initial,
    TResult Function(LoginViewProps loginViewProps)? loading,
    TResult Function(LoginViewProps loginViewProps)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(loginViewProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LVSInitial value) initial,
    required TResult Function(_LVSLoading value) loading,
    required TResult Function(_LVSIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LVSInitial value)? initial,
    TResult Function(_LVSLoading value)? loading,
    TResult Function(_LVSIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _LVSIdle implements LoginViewState {
  const factory _LVSIdle(LoginViewProps loginViewProps) = _$_LVSIdle;

  @override
  LoginViewProps get loginViewProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LVSIdleCopyWith<_LVSIdle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LoginViewPropsTearOff {
  const _$LoginViewPropsTearOff();

  _LoginViewProps call({required bool isInfoTileVisible}) {
    return _LoginViewProps(
      isInfoTileVisible: isInfoTileVisible,
    );
  }
}

/// @nodoc
const $LoginViewProps = _$LoginViewPropsTearOff();

/// @nodoc
mixin _$LoginViewProps {
  bool get isInfoTileVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginViewPropsCopyWith<LoginViewProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginViewPropsCopyWith<$Res> {
  factory $LoginViewPropsCopyWith(
          LoginViewProps value, $Res Function(LoginViewProps) then) =
      _$LoginViewPropsCopyWithImpl<$Res>;
  $Res call({bool isInfoTileVisible});
}

/// @nodoc
class _$LoginViewPropsCopyWithImpl<$Res>
    implements $LoginViewPropsCopyWith<$Res> {
  _$LoginViewPropsCopyWithImpl(this._value, this._then);

  final LoginViewProps _value;
  // ignore: unused_field
  final $Res Function(LoginViewProps) _then;

  @override
  $Res call({
    Object? isInfoTileVisible = freezed,
  }) {
    return _then(_value.copyWith(
      isInfoTileVisible: isInfoTileVisible == freezed
          ? _value.isInfoTileVisible
          : isInfoTileVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$LoginViewPropsCopyWith<$Res>
    implements $LoginViewPropsCopyWith<$Res> {
  factory _$LoginViewPropsCopyWith(
          _LoginViewProps value, $Res Function(_LoginViewProps) then) =
      __$LoginViewPropsCopyWithImpl<$Res>;
  @override
  $Res call({bool isInfoTileVisible});
}

/// @nodoc
class __$LoginViewPropsCopyWithImpl<$Res>
    extends _$LoginViewPropsCopyWithImpl<$Res>
    implements _$LoginViewPropsCopyWith<$Res> {
  __$LoginViewPropsCopyWithImpl(
      _LoginViewProps _value, $Res Function(_LoginViewProps) _then)
      : super(_value, (v) => _then(v as _LoginViewProps));

  @override
  _LoginViewProps get _value => super._value as _LoginViewProps;

  @override
  $Res call({
    Object? isInfoTileVisible = freezed,
  }) {
    return _then(_LoginViewProps(
      isInfoTileVisible: isInfoTileVisible == freezed
          ? _value.isInfoTileVisible
          : isInfoTileVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginViewProps
    with DiagnosticableTreeMixin
    implements _LoginViewProps {
  const _$_LoginViewProps({required this.isInfoTileVisible});

  @override
  final bool isInfoTileVisible;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginViewProps(isInfoTileVisible: $isInfoTileVisible)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginViewProps'))
      ..add(DiagnosticsProperty('isInfoTileVisible', isInfoTileVisible));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginViewProps &&
            (identical(other.isInfoTileVisible, isInfoTileVisible) ||
                const DeepCollectionEquality()
                    .equals(other.isInfoTileVisible, isInfoTileVisible)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isInfoTileVisible);

  @JsonKey(ignore: true)
  @override
  _$LoginViewPropsCopyWith<_LoginViewProps> get copyWith =>
      __$LoginViewPropsCopyWithImpl<_LoginViewProps>(this, _$identity);
}

abstract class _LoginViewProps implements LoginViewProps {
  const factory _LoginViewProps({required bool isInfoTileVisible}) =
      _$_LoginViewProps;

  @override
  bool get isInfoTileVisible => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginViewPropsCopyWith<_LoginViewProps> get copyWith =>
      throw _privateConstructorUsedError;
}
