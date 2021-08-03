// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'info_tile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InfoTileEventTearOff {
  const _$InfoTileEventTearOff();

  _ToggleExpansion toggleExpansion() {
    return const _ToggleExpansion();
  }

  _TriggerStateChange triggerStateChange(InfoTileProps infoTileProps) {
    return _TriggerStateChange(
      infoTileProps,
    );
  }
}

/// @nodoc
const $InfoTileEvent = _$InfoTileEventTearOff();

/// @nodoc
mixin _$InfoTileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleExpansion,
    required TResult Function(InfoTileProps infoTileProps) triggerStateChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleExpansion,
    TResult Function(InfoTileProps infoTileProps)? triggerStateChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleExpansion value) toggleExpansion,
    required TResult Function(_TriggerStateChange value) triggerStateChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleExpansion value)? toggleExpansion,
    TResult Function(_TriggerStateChange value)? triggerStateChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoTileEventCopyWith<$Res> {
  factory $InfoTileEventCopyWith(
          InfoTileEvent value, $Res Function(InfoTileEvent) then) =
      _$InfoTileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InfoTileEventCopyWithImpl<$Res>
    implements $InfoTileEventCopyWith<$Res> {
  _$InfoTileEventCopyWithImpl(this._value, this._then);

  final InfoTileEvent _value;
  // ignore: unused_field
  final $Res Function(InfoTileEvent) _then;
}

/// @nodoc
abstract class _$ToggleExpansionCopyWith<$Res> {
  factory _$ToggleExpansionCopyWith(
          _ToggleExpansion value, $Res Function(_ToggleExpansion) then) =
      __$ToggleExpansionCopyWithImpl<$Res>;
}

/// @nodoc
class __$ToggleExpansionCopyWithImpl<$Res>
    extends _$InfoTileEventCopyWithImpl<$Res>
    implements _$ToggleExpansionCopyWith<$Res> {
  __$ToggleExpansionCopyWithImpl(
      _ToggleExpansion _value, $Res Function(_ToggleExpansion) _then)
      : super(_value, (v) => _then(v as _ToggleExpansion));

  @override
  _ToggleExpansion get _value => super._value as _ToggleExpansion;
}

/// @nodoc

class _$_ToggleExpansion implements _ToggleExpansion {
  const _$_ToggleExpansion();

  @override
  String toString() {
    return 'InfoTileEvent.toggleExpansion()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ToggleExpansion);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleExpansion,
    required TResult Function(InfoTileProps infoTileProps) triggerStateChange,
  }) {
    return toggleExpansion();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleExpansion,
    TResult Function(InfoTileProps infoTileProps)? triggerStateChange,
    required TResult orElse(),
  }) {
    if (toggleExpansion != null) {
      return toggleExpansion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleExpansion value) toggleExpansion,
    required TResult Function(_TriggerStateChange value) triggerStateChange,
  }) {
    return toggleExpansion(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleExpansion value)? toggleExpansion,
    TResult Function(_TriggerStateChange value)? triggerStateChange,
    required TResult orElse(),
  }) {
    if (toggleExpansion != null) {
      return toggleExpansion(this);
    }
    return orElse();
  }
}

abstract class _ToggleExpansion implements InfoTileEvent {
  const factory _ToggleExpansion() = _$_ToggleExpansion;
}

/// @nodoc
abstract class _$TriggerStateChangeCopyWith<$Res> {
  factory _$TriggerStateChangeCopyWith(
          _TriggerStateChange value, $Res Function(_TriggerStateChange) then) =
      __$TriggerStateChangeCopyWithImpl<$Res>;
  $Res call({InfoTileProps infoTileProps});

  $InfoTilePropsCopyWith<$Res> get infoTileProps;
}

/// @nodoc
class __$TriggerStateChangeCopyWithImpl<$Res>
    extends _$InfoTileEventCopyWithImpl<$Res>
    implements _$TriggerStateChangeCopyWith<$Res> {
  __$TriggerStateChangeCopyWithImpl(
      _TriggerStateChange _value, $Res Function(_TriggerStateChange) _then)
      : super(_value, (v) => _then(v as _TriggerStateChange));

  @override
  _TriggerStateChange get _value => super._value as _TriggerStateChange;

  @override
  $Res call({
    Object? infoTileProps = freezed,
  }) {
    return _then(_TriggerStateChange(
      infoTileProps == freezed
          ? _value.infoTileProps
          : infoTileProps // ignore: cast_nullable_to_non_nullable
              as InfoTileProps,
    ));
  }

  @override
  $InfoTilePropsCopyWith<$Res> get infoTileProps {
    return $InfoTilePropsCopyWith<$Res>(_value.infoTileProps, (value) {
      return _then(_value.copyWith(infoTileProps: value));
    });
  }
}

/// @nodoc

class _$_TriggerStateChange implements _TriggerStateChange {
  const _$_TriggerStateChange(this.infoTileProps);

  @override
  final InfoTileProps infoTileProps;

  @override
  String toString() {
    return 'InfoTileEvent.triggerStateChange(infoTileProps: $infoTileProps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TriggerStateChange &&
            (identical(other.infoTileProps, infoTileProps) ||
                const DeepCollectionEquality()
                    .equals(other.infoTileProps, infoTileProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(infoTileProps);

  @JsonKey(ignore: true)
  @override
  _$TriggerStateChangeCopyWith<_TriggerStateChange> get copyWith =>
      __$TriggerStateChangeCopyWithImpl<_TriggerStateChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleExpansion,
    required TResult Function(InfoTileProps infoTileProps) triggerStateChange,
  }) {
    return triggerStateChange(infoTileProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleExpansion,
    TResult Function(InfoTileProps infoTileProps)? triggerStateChange,
    required TResult orElse(),
  }) {
    if (triggerStateChange != null) {
      return triggerStateChange(infoTileProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleExpansion value) toggleExpansion,
    required TResult Function(_TriggerStateChange value) triggerStateChange,
  }) {
    return triggerStateChange(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleExpansion value)? toggleExpansion,
    TResult Function(_TriggerStateChange value)? triggerStateChange,
    required TResult orElse(),
  }) {
    if (triggerStateChange != null) {
      return triggerStateChange(this);
    }
    return orElse();
  }
}

abstract class _TriggerStateChange implements InfoTileEvent {
  const factory _TriggerStateChange(InfoTileProps infoTileProps) =
      _$_TriggerStateChange;

  InfoTileProps get infoTileProps => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TriggerStateChangeCopyWith<_TriggerStateChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$InfoTileStateTearOff {
  const _$InfoTileStateTearOff();

  _Invisible invisible(InfoTileProps infoTileProps) {
    return _Invisible(
      infoTileProps,
    );
  }

  _Loading loading(InfoTileProps infoTileProps) {
    return _Loading(
      infoTileProps,
    );
  }

  _LoadingExpanded loadingExpanded(InfoTileProps infoTileProps) {
    return _LoadingExpanded(
      infoTileProps,
    );
  }

  _Success success(InfoTileProps infoTileProps) {
    return _Success(
      infoTileProps,
    );
  }

  _SuccessExpanded successExpanded(InfoTileProps infoTileProps) {
    return _SuccessExpanded(
      infoTileProps,
    );
  }

  _Failure failure(InfoTileProps infoTileProps) {
    return _Failure(
      infoTileProps,
    );
  }

  _FailureExpanded failureExpanded(InfoTileProps infoTileProps) {
    return _FailureExpanded(
      infoTileProps,
    );
  }
}

/// @nodoc
const $InfoTileState = _$InfoTileStateTearOff();

/// @nodoc
mixin _$InfoTileState {
  InfoTileProps get infoTileProps => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InfoTileProps infoTileProps) invisible,
    required TResult Function(InfoTileProps infoTileProps) loading,
    required TResult Function(InfoTileProps infoTileProps) loadingExpanded,
    required TResult Function(InfoTileProps infoTileProps) success,
    required TResult Function(InfoTileProps infoTileProps) successExpanded,
    required TResult Function(InfoTileProps infoTileProps) failure,
    required TResult Function(InfoTileProps infoTileProps) failureExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InfoTileProps infoTileProps)? invisible,
    TResult Function(InfoTileProps infoTileProps)? loading,
    TResult Function(InfoTileProps infoTileProps)? loadingExpanded,
    TResult Function(InfoTileProps infoTileProps)? success,
    TResult Function(InfoTileProps infoTileProps)? successExpanded,
    TResult Function(InfoTileProps infoTileProps)? failure,
    TResult Function(InfoTileProps infoTileProps)? failureExpanded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invisible value) invisible,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingExpanded value) loadingExpanded,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessExpanded value) successExpanded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_FailureExpanded value) failureExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invisible value)? invisible,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingExpanded value)? loadingExpanded,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessExpanded value)? successExpanded,
    TResult Function(_Failure value)? failure,
    TResult Function(_FailureExpanded value)? failureExpanded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InfoTileStateCopyWith<InfoTileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoTileStateCopyWith<$Res> {
  factory $InfoTileStateCopyWith(
          InfoTileState value, $Res Function(InfoTileState) then) =
      _$InfoTileStateCopyWithImpl<$Res>;
  $Res call({InfoTileProps infoTileProps});

  $InfoTilePropsCopyWith<$Res> get infoTileProps;
}

/// @nodoc
class _$InfoTileStateCopyWithImpl<$Res>
    implements $InfoTileStateCopyWith<$Res> {
  _$InfoTileStateCopyWithImpl(this._value, this._then);

  final InfoTileState _value;
  // ignore: unused_field
  final $Res Function(InfoTileState) _then;

  @override
  $Res call({
    Object? infoTileProps = freezed,
  }) {
    return _then(_value.copyWith(
      infoTileProps: infoTileProps == freezed
          ? _value.infoTileProps
          : infoTileProps // ignore: cast_nullable_to_non_nullable
              as InfoTileProps,
    ));
  }

  @override
  $InfoTilePropsCopyWith<$Res> get infoTileProps {
    return $InfoTilePropsCopyWith<$Res>(_value.infoTileProps, (value) {
      return _then(_value.copyWith(infoTileProps: value));
    });
  }
}

/// @nodoc
abstract class _$InvisibleCopyWith<$Res>
    implements $InfoTileStateCopyWith<$Res> {
  factory _$InvisibleCopyWith(
          _Invisible value, $Res Function(_Invisible) then) =
      __$InvisibleCopyWithImpl<$Res>;
  @override
  $Res call({InfoTileProps infoTileProps});

  @override
  $InfoTilePropsCopyWith<$Res> get infoTileProps;
}

/// @nodoc
class __$InvisibleCopyWithImpl<$Res> extends _$InfoTileStateCopyWithImpl<$Res>
    implements _$InvisibleCopyWith<$Res> {
  __$InvisibleCopyWithImpl(_Invisible _value, $Res Function(_Invisible) _then)
      : super(_value, (v) => _then(v as _Invisible));

  @override
  _Invisible get _value => super._value as _Invisible;

  @override
  $Res call({
    Object? infoTileProps = freezed,
  }) {
    return _then(_Invisible(
      infoTileProps == freezed
          ? _value.infoTileProps
          : infoTileProps // ignore: cast_nullable_to_non_nullable
              as InfoTileProps,
    ));
  }
}

/// @nodoc

class _$_Invisible implements _Invisible {
  const _$_Invisible(this.infoTileProps);

  @override
  final InfoTileProps infoTileProps;

  @override
  String toString() {
    return 'InfoTileState.invisible(infoTileProps: $infoTileProps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Invisible &&
            (identical(other.infoTileProps, infoTileProps) ||
                const DeepCollectionEquality()
                    .equals(other.infoTileProps, infoTileProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(infoTileProps);

  @JsonKey(ignore: true)
  @override
  _$InvisibleCopyWith<_Invisible> get copyWith =>
      __$InvisibleCopyWithImpl<_Invisible>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InfoTileProps infoTileProps) invisible,
    required TResult Function(InfoTileProps infoTileProps) loading,
    required TResult Function(InfoTileProps infoTileProps) loadingExpanded,
    required TResult Function(InfoTileProps infoTileProps) success,
    required TResult Function(InfoTileProps infoTileProps) successExpanded,
    required TResult Function(InfoTileProps infoTileProps) failure,
    required TResult Function(InfoTileProps infoTileProps) failureExpanded,
  }) {
    return invisible(infoTileProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InfoTileProps infoTileProps)? invisible,
    TResult Function(InfoTileProps infoTileProps)? loading,
    TResult Function(InfoTileProps infoTileProps)? loadingExpanded,
    TResult Function(InfoTileProps infoTileProps)? success,
    TResult Function(InfoTileProps infoTileProps)? successExpanded,
    TResult Function(InfoTileProps infoTileProps)? failure,
    TResult Function(InfoTileProps infoTileProps)? failureExpanded,
    required TResult orElse(),
  }) {
    if (invisible != null) {
      return invisible(infoTileProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invisible value) invisible,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingExpanded value) loadingExpanded,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessExpanded value) successExpanded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_FailureExpanded value) failureExpanded,
  }) {
    return invisible(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invisible value)? invisible,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingExpanded value)? loadingExpanded,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessExpanded value)? successExpanded,
    TResult Function(_Failure value)? failure,
    TResult Function(_FailureExpanded value)? failureExpanded,
    required TResult orElse(),
  }) {
    if (invisible != null) {
      return invisible(this);
    }
    return orElse();
  }
}

abstract class _Invisible implements InfoTileState {
  const factory _Invisible(InfoTileProps infoTileProps) = _$_Invisible;

  @override
  InfoTileProps get infoTileProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InvisibleCopyWith<_Invisible> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> implements $InfoTileStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({InfoTileProps infoTileProps});

  @override
  $InfoTilePropsCopyWith<$Res> get infoTileProps;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$InfoTileStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? infoTileProps = freezed,
  }) {
    return _then(_Loading(
      infoTileProps == freezed
          ? _value.infoTileProps
          : infoTileProps // ignore: cast_nullable_to_non_nullable
              as InfoTileProps,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(this.infoTileProps);

  @override
  final InfoTileProps infoTileProps;

  @override
  String toString() {
    return 'InfoTileState.loading(infoTileProps: $infoTileProps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.infoTileProps, infoTileProps) ||
                const DeepCollectionEquality()
                    .equals(other.infoTileProps, infoTileProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(infoTileProps);

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InfoTileProps infoTileProps) invisible,
    required TResult Function(InfoTileProps infoTileProps) loading,
    required TResult Function(InfoTileProps infoTileProps) loadingExpanded,
    required TResult Function(InfoTileProps infoTileProps) success,
    required TResult Function(InfoTileProps infoTileProps) successExpanded,
    required TResult Function(InfoTileProps infoTileProps) failure,
    required TResult Function(InfoTileProps infoTileProps) failureExpanded,
  }) {
    return loading(infoTileProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InfoTileProps infoTileProps)? invisible,
    TResult Function(InfoTileProps infoTileProps)? loading,
    TResult Function(InfoTileProps infoTileProps)? loadingExpanded,
    TResult Function(InfoTileProps infoTileProps)? success,
    TResult Function(InfoTileProps infoTileProps)? successExpanded,
    TResult Function(InfoTileProps infoTileProps)? failure,
    TResult Function(InfoTileProps infoTileProps)? failureExpanded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(infoTileProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invisible value) invisible,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingExpanded value) loadingExpanded,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessExpanded value) successExpanded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_FailureExpanded value) failureExpanded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invisible value)? invisible,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingExpanded value)? loadingExpanded,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessExpanded value)? successExpanded,
    TResult Function(_Failure value)? failure,
    TResult Function(_FailureExpanded value)? failureExpanded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements InfoTileState {
  const factory _Loading(InfoTileProps infoTileProps) = _$_Loading;

  @override
  InfoTileProps get infoTileProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingExpandedCopyWith<$Res>
    implements $InfoTileStateCopyWith<$Res> {
  factory _$LoadingExpandedCopyWith(
          _LoadingExpanded value, $Res Function(_LoadingExpanded) then) =
      __$LoadingExpandedCopyWithImpl<$Res>;
  @override
  $Res call({InfoTileProps infoTileProps});

  @override
  $InfoTilePropsCopyWith<$Res> get infoTileProps;
}

/// @nodoc
class __$LoadingExpandedCopyWithImpl<$Res>
    extends _$InfoTileStateCopyWithImpl<$Res>
    implements _$LoadingExpandedCopyWith<$Res> {
  __$LoadingExpandedCopyWithImpl(
      _LoadingExpanded _value, $Res Function(_LoadingExpanded) _then)
      : super(_value, (v) => _then(v as _LoadingExpanded));

  @override
  _LoadingExpanded get _value => super._value as _LoadingExpanded;

  @override
  $Res call({
    Object? infoTileProps = freezed,
  }) {
    return _then(_LoadingExpanded(
      infoTileProps == freezed
          ? _value.infoTileProps
          : infoTileProps // ignore: cast_nullable_to_non_nullable
              as InfoTileProps,
    ));
  }
}

/// @nodoc

class _$_LoadingExpanded implements _LoadingExpanded {
  const _$_LoadingExpanded(this.infoTileProps);

  @override
  final InfoTileProps infoTileProps;

  @override
  String toString() {
    return 'InfoTileState.loadingExpanded(infoTileProps: $infoTileProps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingExpanded &&
            (identical(other.infoTileProps, infoTileProps) ||
                const DeepCollectionEquality()
                    .equals(other.infoTileProps, infoTileProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(infoTileProps);

  @JsonKey(ignore: true)
  @override
  _$LoadingExpandedCopyWith<_LoadingExpanded> get copyWith =>
      __$LoadingExpandedCopyWithImpl<_LoadingExpanded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InfoTileProps infoTileProps) invisible,
    required TResult Function(InfoTileProps infoTileProps) loading,
    required TResult Function(InfoTileProps infoTileProps) loadingExpanded,
    required TResult Function(InfoTileProps infoTileProps) success,
    required TResult Function(InfoTileProps infoTileProps) successExpanded,
    required TResult Function(InfoTileProps infoTileProps) failure,
    required TResult Function(InfoTileProps infoTileProps) failureExpanded,
  }) {
    return loadingExpanded(infoTileProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InfoTileProps infoTileProps)? invisible,
    TResult Function(InfoTileProps infoTileProps)? loading,
    TResult Function(InfoTileProps infoTileProps)? loadingExpanded,
    TResult Function(InfoTileProps infoTileProps)? success,
    TResult Function(InfoTileProps infoTileProps)? successExpanded,
    TResult Function(InfoTileProps infoTileProps)? failure,
    TResult Function(InfoTileProps infoTileProps)? failureExpanded,
    required TResult orElse(),
  }) {
    if (loadingExpanded != null) {
      return loadingExpanded(infoTileProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invisible value) invisible,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingExpanded value) loadingExpanded,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessExpanded value) successExpanded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_FailureExpanded value) failureExpanded,
  }) {
    return loadingExpanded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invisible value)? invisible,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingExpanded value)? loadingExpanded,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessExpanded value)? successExpanded,
    TResult Function(_Failure value)? failure,
    TResult Function(_FailureExpanded value)? failureExpanded,
    required TResult orElse(),
  }) {
    if (loadingExpanded != null) {
      return loadingExpanded(this);
    }
    return orElse();
  }
}

abstract class _LoadingExpanded implements InfoTileState {
  const factory _LoadingExpanded(InfoTileProps infoTileProps) =
      _$_LoadingExpanded;

  @override
  InfoTileProps get infoTileProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadingExpandedCopyWith<_LoadingExpanded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> implements $InfoTileStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({InfoTileProps infoTileProps});

  @override
  $InfoTilePropsCopyWith<$Res> get infoTileProps;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$InfoTileStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? infoTileProps = freezed,
  }) {
    return _then(_Success(
      infoTileProps == freezed
          ? _value.infoTileProps
          : infoTileProps // ignore: cast_nullable_to_non_nullable
              as InfoTileProps,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.infoTileProps);

  @override
  final InfoTileProps infoTileProps;

  @override
  String toString() {
    return 'InfoTileState.success(infoTileProps: $infoTileProps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success &&
            (identical(other.infoTileProps, infoTileProps) ||
                const DeepCollectionEquality()
                    .equals(other.infoTileProps, infoTileProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(infoTileProps);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InfoTileProps infoTileProps) invisible,
    required TResult Function(InfoTileProps infoTileProps) loading,
    required TResult Function(InfoTileProps infoTileProps) loadingExpanded,
    required TResult Function(InfoTileProps infoTileProps) success,
    required TResult Function(InfoTileProps infoTileProps) successExpanded,
    required TResult Function(InfoTileProps infoTileProps) failure,
    required TResult Function(InfoTileProps infoTileProps) failureExpanded,
  }) {
    return success(infoTileProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InfoTileProps infoTileProps)? invisible,
    TResult Function(InfoTileProps infoTileProps)? loading,
    TResult Function(InfoTileProps infoTileProps)? loadingExpanded,
    TResult Function(InfoTileProps infoTileProps)? success,
    TResult Function(InfoTileProps infoTileProps)? successExpanded,
    TResult Function(InfoTileProps infoTileProps)? failure,
    TResult Function(InfoTileProps infoTileProps)? failureExpanded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(infoTileProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invisible value) invisible,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingExpanded value) loadingExpanded,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessExpanded value) successExpanded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_FailureExpanded value) failureExpanded,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invisible value)? invisible,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingExpanded value)? loadingExpanded,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessExpanded value)? successExpanded,
    TResult Function(_Failure value)? failure,
    TResult Function(_FailureExpanded value)? failureExpanded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements InfoTileState {
  const factory _Success(InfoTileProps infoTileProps) = _$_Success;

  @override
  InfoTileProps get infoTileProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessExpandedCopyWith<$Res>
    implements $InfoTileStateCopyWith<$Res> {
  factory _$SuccessExpandedCopyWith(
          _SuccessExpanded value, $Res Function(_SuccessExpanded) then) =
      __$SuccessExpandedCopyWithImpl<$Res>;
  @override
  $Res call({InfoTileProps infoTileProps});

  @override
  $InfoTilePropsCopyWith<$Res> get infoTileProps;
}

/// @nodoc
class __$SuccessExpandedCopyWithImpl<$Res>
    extends _$InfoTileStateCopyWithImpl<$Res>
    implements _$SuccessExpandedCopyWith<$Res> {
  __$SuccessExpandedCopyWithImpl(
      _SuccessExpanded _value, $Res Function(_SuccessExpanded) _then)
      : super(_value, (v) => _then(v as _SuccessExpanded));

  @override
  _SuccessExpanded get _value => super._value as _SuccessExpanded;

  @override
  $Res call({
    Object? infoTileProps = freezed,
  }) {
    return _then(_SuccessExpanded(
      infoTileProps == freezed
          ? _value.infoTileProps
          : infoTileProps // ignore: cast_nullable_to_non_nullable
              as InfoTileProps,
    ));
  }
}

/// @nodoc

class _$_SuccessExpanded implements _SuccessExpanded {
  const _$_SuccessExpanded(this.infoTileProps);

  @override
  final InfoTileProps infoTileProps;

  @override
  String toString() {
    return 'InfoTileState.successExpanded(infoTileProps: $infoTileProps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SuccessExpanded &&
            (identical(other.infoTileProps, infoTileProps) ||
                const DeepCollectionEquality()
                    .equals(other.infoTileProps, infoTileProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(infoTileProps);

  @JsonKey(ignore: true)
  @override
  _$SuccessExpandedCopyWith<_SuccessExpanded> get copyWith =>
      __$SuccessExpandedCopyWithImpl<_SuccessExpanded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InfoTileProps infoTileProps) invisible,
    required TResult Function(InfoTileProps infoTileProps) loading,
    required TResult Function(InfoTileProps infoTileProps) loadingExpanded,
    required TResult Function(InfoTileProps infoTileProps) success,
    required TResult Function(InfoTileProps infoTileProps) successExpanded,
    required TResult Function(InfoTileProps infoTileProps) failure,
    required TResult Function(InfoTileProps infoTileProps) failureExpanded,
  }) {
    return successExpanded(infoTileProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InfoTileProps infoTileProps)? invisible,
    TResult Function(InfoTileProps infoTileProps)? loading,
    TResult Function(InfoTileProps infoTileProps)? loadingExpanded,
    TResult Function(InfoTileProps infoTileProps)? success,
    TResult Function(InfoTileProps infoTileProps)? successExpanded,
    TResult Function(InfoTileProps infoTileProps)? failure,
    TResult Function(InfoTileProps infoTileProps)? failureExpanded,
    required TResult orElse(),
  }) {
    if (successExpanded != null) {
      return successExpanded(infoTileProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invisible value) invisible,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingExpanded value) loadingExpanded,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessExpanded value) successExpanded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_FailureExpanded value) failureExpanded,
  }) {
    return successExpanded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invisible value)? invisible,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingExpanded value)? loadingExpanded,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessExpanded value)? successExpanded,
    TResult Function(_Failure value)? failure,
    TResult Function(_FailureExpanded value)? failureExpanded,
    required TResult orElse(),
  }) {
    if (successExpanded != null) {
      return successExpanded(this);
    }
    return orElse();
  }
}

abstract class _SuccessExpanded implements InfoTileState {
  const factory _SuccessExpanded(InfoTileProps infoTileProps) =
      _$_SuccessExpanded;

  @override
  InfoTileProps get infoTileProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SuccessExpandedCopyWith<_SuccessExpanded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res> implements $InfoTileStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  @override
  $Res call({InfoTileProps infoTileProps});

  @override
  $InfoTilePropsCopyWith<$Res> get infoTileProps;
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> extends _$InfoTileStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object? infoTileProps = freezed,
  }) {
    return _then(_Failure(
      infoTileProps == freezed
          ? _value.infoTileProps
          : infoTileProps // ignore: cast_nullable_to_non_nullable
              as InfoTileProps,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure(this.infoTileProps);

  @override
  final InfoTileProps infoTileProps;

  @override
  String toString() {
    return 'InfoTileState.failure(infoTileProps: $infoTileProps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failure &&
            (identical(other.infoTileProps, infoTileProps) ||
                const DeepCollectionEquality()
                    .equals(other.infoTileProps, infoTileProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(infoTileProps);

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InfoTileProps infoTileProps) invisible,
    required TResult Function(InfoTileProps infoTileProps) loading,
    required TResult Function(InfoTileProps infoTileProps) loadingExpanded,
    required TResult Function(InfoTileProps infoTileProps) success,
    required TResult Function(InfoTileProps infoTileProps) successExpanded,
    required TResult Function(InfoTileProps infoTileProps) failure,
    required TResult Function(InfoTileProps infoTileProps) failureExpanded,
  }) {
    return failure(infoTileProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InfoTileProps infoTileProps)? invisible,
    TResult Function(InfoTileProps infoTileProps)? loading,
    TResult Function(InfoTileProps infoTileProps)? loadingExpanded,
    TResult Function(InfoTileProps infoTileProps)? success,
    TResult Function(InfoTileProps infoTileProps)? successExpanded,
    TResult Function(InfoTileProps infoTileProps)? failure,
    TResult Function(InfoTileProps infoTileProps)? failureExpanded,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(infoTileProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invisible value) invisible,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingExpanded value) loadingExpanded,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessExpanded value) successExpanded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_FailureExpanded value) failureExpanded,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invisible value)? invisible,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingExpanded value)? loadingExpanded,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessExpanded value)? successExpanded,
    TResult Function(_Failure value)? failure,
    TResult Function(_FailureExpanded value)? failureExpanded,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements InfoTileState {
  const factory _Failure(InfoTileProps infoTileProps) = _$_Failure;

  @override
  InfoTileProps get infoTileProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureExpandedCopyWith<$Res>
    implements $InfoTileStateCopyWith<$Res> {
  factory _$FailureExpandedCopyWith(
          _FailureExpanded value, $Res Function(_FailureExpanded) then) =
      __$FailureExpandedCopyWithImpl<$Res>;
  @override
  $Res call({InfoTileProps infoTileProps});

  @override
  $InfoTilePropsCopyWith<$Res> get infoTileProps;
}

/// @nodoc
class __$FailureExpandedCopyWithImpl<$Res>
    extends _$InfoTileStateCopyWithImpl<$Res>
    implements _$FailureExpandedCopyWith<$Res> {
  __$FailureExpandedCopyWithImpl(
      _FailureExpanded _value, $Res Function(_FailureExpanded) _then)
      : super(_value, (v) => _then(v as _FailureExpanded));

  @override
  _FailureExpanded get _value => super._value as _FailureExpanded;

  @override
  $Res call({
    Object? infoTileProps = freezed,
  }) {
    return _then(_FailureExpanded(
      infoTileProps == freezed
          ? _value.infoTileProps
          : infoTileProps // ignore: cast_nullable_to_non_nullable
              as InfoTileProps,
    ));
  }
}

/// @nodoc

class _$_FailureExpanded implements _FailureExpanded {
  const _$_FailureExpanded(this.infoTileProps);

  @override
  final InfoTileProps infoTileProps;

  @override
  String toString() {
    return 'InfoTileState.failureExpanded(infoTileProps: $infoTileProps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FailureExpanded &&
            (identical(other.infoTileProps, infoTileProps) ||
                const DeepCollectionEquality()
                    .equals(other.infoTileProps, infoTileProps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(infoTileProps);

  @JsonKey(ignore: true)
  @override
  _$FailureExpandedCopyWith<_FailureExpanded> get copyWith =>
      __$FailureExpandedCopyWithImpl<_FailureExpanded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InfoTileProps infoTileProps) invisible,
    required TResult Function(InfoTileProps infoTileProps) loading,
    required TResult Function(InfoTileProps infoTileProps) loadingExpanded,
    required TResult Function(InfoTileProps infoTileProps) success,
    required TResult Function(InfoTileProps infoTileProps) successExpanded,
    required TResult Function(InfoTileProps infoTileProps) failure,
    required TResult Function(InfoTileProps infoTileProps) failureExpanded,
  }) {
    return failureExpanded(infoTileProps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InfoTileProps infoTileProps)? invisible,
    TResult Function(InfoTileProps infoTileProps)? loading,
    TResult Function(InfoTileProps infoTileProps)? loadingExpanded,
    TResult Function(InfoTileProps infoTileProps)? success,
    TResult Function(InfoTileProps infoTileProps)? successExpanded,
    TResult Function(InfoTileProps infoTileProps)? failure,
    TResult Function(InfoTileProps infoTileProps)? failureExpanded,
    required TResult orElse(),
  }) {
    if (failureExpanded != null) {
      return failureExpanded(infoTileProps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invisible value) invisible,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingExpanded value) loadingExpanded,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessExpanded value) successExpanded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_FailureExpanded value) failureExpanded,
  }) {
    return failureExpanded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invisible value)? invisible,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingExpanded value)? loadingExpanded,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessExpanded value)? successExpanded,
    TResult Function(_Failure value)? failure,
    TResult Function(_FailureExpanded value)? failureExpanded,
    required TResult orElse(),
  }) {
    if (failureExpanded != null) {
      return failureExpanded(this);
    }
    return orElse();
  }
}

abstract class _FailureExpanded implements InfoTileState {
  const factory _FailureExpanded(InfoTileProps infoTileProps) =
      _$_FailureExpanded;

  @override
  InfoTileProps get infoTileProps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FailureExpandedCopyWith<_FailureExpanded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$InfoTilePropsTearOff {
  const _$InfoTilePropsTearOff();

  _InfoTileProps call(
      {required String leadingText,
      required Widget child,
      required bool isAbleToExpand,
      required bool isExpanded,
      required InfoTileStatus currentStatus,
      AnimationController? animationController}) {
    return _InfoTileProps(
      leadingText: leadingText,
      child: child,
      isAbleToExpand: isAbleToExpand,
      isExpanded: isExpanded,
      currentStatus: currentStatus,
      animationController: animationController,
    );
  }
}

/// @nodoc
const $InfoTileProps = _$InfoTilePropsTearOff();

/// @nodoc
mixin _$InfoTileProps {
  String get leadingText => throw _privateConstructorUsedError;
  Widget get child => throw _privateConstructorUsedError;
  bool get isAbleToExpand => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;
  InfoTileStatus get currentStatus => throw _privateConstructorUsedError;
  AnimationController? get animationController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InfoTilePropsCopyWith<InfoTileProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoTilePropsCopyWith<$Res> {
  factory $InfoTilePropsCopyWith(
          InfoTileProps value, $Res Function(InfoTileProps) then) =
      _$InfoTilePropsCopyWithImpl<$Res>;
  $Res call(
      {String leadingText,
      Widget child,
      bool isAbleToExpand,
      bool isExpanded,
      InfoTileStatus currentStatus,
      AnimationController? animationController});
}

/// @nodoc
class _$InfoTilePropsCopyWithImpl<$Res>
    implements $InfoTilePropsCopyWith<$Res> {
  _$InfoTilePropsCopyWithImpl(this._value, this._then);

  final InfoTileProps _value;
  // ignore: unused_field
  final $Res Function(InfoTileProps) _then;

  @override
  $Res call({
    Object? leadingText = freezed,
    Object? child = freezed,
    Object? isAbleToExpand = freezed,
    Object? isExpanded = freezed,
    Object? currentStatus = freezed,
    Object? animationController = freezed,
  }) {
    return _then(_value.copyWith(
      leadingText: leadingText == freezed
          ? _value.leadingText
          : leadingText // ignore: cast_nullable_to_non_nullable
              as String,
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
      isAbleToExpand: isAbleToExpand == freezed
          ? _value.isAbleToExpand
          : isAbleToExpand // ignore: cast_nullable_to_non_nullable
              as bool,
      isExpanded: isExpanded == freezed
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      currentStatus: currentStatus == freezed
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as InfoTileStatus,
      animationController: animationController == freezed
          ? _value.animationController
          : animationController // ignore: cast_nullable_to_non_nullable
              as AnimationController?,
    ));
  }
}

/// @nodoc
abstract class _$InfoTilePropsCopyWith<$Res>
    implements $InfoTilePropsCopyWith<$Res> {
  factory _$InfoTilePropsCopyWith(
          _InfoTileProps value, $Res Function(_InfoTileProps) then) =
      __$InfoTilePropsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String leadingText,
      Widget child,
      bool isAbleToExpand,
      bool isExpanded,
      InfoTileStatus currentStatus,
      AnimationController? animationController});
}

/// @nodoc
class __$InfoTilePropsCopyWithImpl<$Res>
    extends _$InfoTilePropsCopyWithImpl<$Res>
    implements _$InfoTilePropsCopyWith<$Res> {
  __$InfoTilePropsCopyWithImpl(
      _InfoTileProps _value, $Res Function(_InfoTileProps) _then)
      : super(_value, (v) => _then(v as _InfoTileProps));

  @override
  _InfoTileProps get _value => super._value as _InfoTileProps;

  @override
  $Res call({
    Object? leadingText = freezed,
    Object? child = freezed,
    Object? isAbleToExpand = freezed,
    Object? isExpanded = freezed,
    Object? currentStatus = freezed,
    Object? animationController = freezed,
  }) {
    return _then(_InfoTileProps(
      leadingText: leadingText == freezed
          ? _value.leadingText
          : leadingText // ignore: cast_nullable_to_non_nullable
              as String,
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
      isAbleToExpand: isAbleToExpand == freezed
          ? _value.isAbleToExpand
          : isAbleToExpand // ignore: cast_nullable_to_non_nullable
              as bool,
      isExpanded: isExpanded == freezed
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      currentStatus: currentStatus == freezed
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as InfoTileStatus,
      animationController: animationController == freezed
          ? _value.animationController
          : animationController // ignore: cast_nullable_to_non_nullable
              as AnimationController?,
    ));
  }
}

/// @nodoc

class _$_InfoTileProps implements _InfoTileProps {
  const _$_InfoTileProps(
      {required this.leadingText,
      required this.child,
      required this.isAbleToExpand,
      required this.isExpanded,
      required this.currentStatus,
      this.animationController});

  @override
  final String leadingText;
  @override
  final Widget child;
  @override
  final bool isAbleToExpand;
  @override
  final bool isExpanded;
  @override
  final InfoTileStatus currentStatus;
  @override
  final AnimationController? animationController;

  @override
  String toString() {
    return 'InfoTileProps(leadingText: $leadingText, child: $child, isAbleToExpand: $isAbleToExpand, isExpanded: $isExpanded, currentStatus: $currentStatus, animationController: $animationController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InfoTileProps &&
            (identical(other.leadingText, leadingText) ||
                const DeepCollectionEquality()
                    .equals(other.leadingText, leadingText)) &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)) &&
            (identical(other.isAbleToExpand, isAbleToExpand) ||
                const DeepCollectionEquality()
                    .equals(other.isAbleToExpand, isAbleToExpand)) &&
            (identical(other.isExpanded, isExpanded) ||
                const DeepCollectionEquality()
                    .equals(other.isExpanded, isExpanded)) &&
            (identical(other.currentStatus, currentStatus) ||
                const DeepCollectionEquality()
                    .equals(other.currentStatus, currentStatus)) &&
            (identical(other.animationController, animationController) ||
                const DeepCollectionEquality()
                    .equals(other.animationController, animationController)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(leadingText) ^
      const DeepCollectionEquality().hash(child) ^
      const DeepCollectionEquality().hash(isAbleToExpand) ^
      const DeepCollectionEquality().hash(isExpanded) ^
      const DeepCollectionEquality().hash(currentStatus) ^
      const DeepCollectionEquality().hash(animationController);

  @JsonKey(ignore: true)
  @override
  _$InfoTilePropsCopyWith<_InfoTileProps> get copyWith =>
      __$InfoTilePropsCopyWithImpl<_InfoTileProps>(this, _$identity);
}

abstract class _InfoTileProps implements InfoTileProps {
  const factory _InfoTileProps(
      {required String leadingText,
      required Widget child,
      required bool isAbleToExpand,
      required bool isExpanded,
      required InfoTileStatus currentStatus,
      AnimationController? animationController}) = _$_InfoTileProps;

  @override
  String get leadingText => throw _privateConstructorUsedError;
  @override
  Widget get child => throw _privateConstructorUsedError;
  @override
  bool get isAbleToExpand => throw _privateConstructorUsedError;
  @override
  bool get isExpanded => throw _privateConstructorUsedError;
  @override
  InfoTileStatus get currentStatus => throw _privateConstructorUsedError;
  @override
  AnimationController? get animationController =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InfoTilePropsCopyWith<_InfoTileProps> get copyWith =>
      throw _privateConstructorUsedError;
}
