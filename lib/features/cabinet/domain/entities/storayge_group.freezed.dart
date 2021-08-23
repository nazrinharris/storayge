// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'storayge_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoraygeGroup _$StoraygeGroupFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return _StoraygeGroup.fromJson(json);
    case 'storaygeGroupAllList':
      return StoraygeGroupAllList.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$StoraygeGroupTearOff {
  const _$StoraygeGroupTearOff();

  _StoraygeGroup call(
      {required String sgId,
      required String? sgName,
      required String? sgDesc,
      required List<String?>? sgImgPathList}) {
    return _StoraygeGroup(
      sgId: sgId,
      sgName: sgName,
      sgDesc: sgDesc,
      sgImgPathList: sgImgPathList,
    );
  }

  StoraygeGroupAllList storaygeGroupAllList(
      {@JsonKey(name: "sgSnippet")
          required List<StoraygeGroupSnippet> sgAllList}) {
    return StoraygeGroupAllList(
      sgAllList: sgAllList,
    );
  }

  StoraygeGroup fromJson(Map<String, Object> json) {
    return StoraygeGroup.fromJson(json);
  }
}

/// @nodoc
const $StoraygeGroup = _$StoraygeGroupTearOff();

/// @nodoc
mixin _$StoraygeGroup {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String sgId, String? sgName, String? sgDesc,
            List<String?>? sgImgPathList)
        $default, {
    required TResult Function(
            @JsonKey(name: "sgSnippet") List<StoraygeGroupSnippet> sgAllList)
        storaygeGroupAllList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String sgId, String? sgName, String? sgDesc,
            List<String?>? sgImgPathList)?
        $default, {
    TResult Function(
            @JsonKey(name: "sgSnippet") List<StoraygeGroupSnippet> sgAllList)?
        storaygeGroupAllList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_StoraygeGroup value) $default, {
    required TResult Function(StoraygeGroupAllList value) storaygeGroupAllList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_StoraygeGroup value)? $default, {
    TResult Function(StoraygeGroupAllList value)? storaygeGroupAllList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoraygeGroupCopyWith<$Res> {
  factory $StoraygeGroupCopyWith(
          StoraygeGroup value, $Res Function(StoraygeGroup) then) =
      _$StoraygeGroupCopyWithImpl<$Res>;
}

/// @nodoc
class _$StoraygeGroupCopyWithImpl<$Res>
    implements $StoraygeGroupCopyWith<$Res> {
  _$StoraygeGroupCopyWithImpl(this._value, this._then);

  final StoraygeGroup _value;
  // ignore: unused_field
  final $Res Function(StoraygeGroup) _then;
}

/// @nodoc
abstract class _$StoraygeGroupCopyWith<$Res> {
  factory _$StoraygeGroupCopyWith(
          _StoraygeGroup value, $Res Function(_StoraygeGroup) then) =
      __$StoraygeGroupCopyWithImpl<$Res>;
  $Res call(
      {String sgId,
      String? sgName,
      String? sgDesc,
      List<String?>? sgImgPathList});
}

/// @nodoc
class __$StoraygeGroupCopyWithImpl<$Res>
    extends _$StoraygeGroupCopyWithImpl<$Res>
    implements _$StoraygeGroupCopyWith<$Res> {
  __$StoraygeGroupCopyWithImpl(
      _StoraygeGroup _value, $Res Function(_StoraygeGroup) _then)
      : super(_value, (v) => _then(v as _StoraygeGroup));

  @override
  _StoraygeGroup get _value => super._value as _StoraygeGroup;

  @override
  $Res call({
    Object? sgId = freezed,
    Object? sgName = freezed,
    Object? sgDesc = freezed,
    Object? sgImgPathList = freezed,
  }) {
    return _then(_StoraygeGroup(
      sgId: sgId == freezed
          ? _value.sgId
          : sgId // ignore: cast_nullable_to_non_nullable
              as String,
      sgName: sgName == freezed
          ? _value.sgName
          : sgName // ignore: cast_nullable_to_non_nullable
              as String?,
      sgDesc: sgDesc == freezed
          ? _value.sgDesc
          : sgDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      sgImgPathList: sgImgPathList == freezed
          ? _value.sgImgPathList
          : sgImgPathList // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_StoraygeGroup extends _StoraygeGroup {
  _$_StoraygeGroup(
      {required this.sgId,
      required this.sgName,
      required this.sgDesc,
      required this.sgImgPathList})
      : super._();

  factory _$_StoraygeGroup.fromJson(Map<String, dynamic> json) =>
      _$_$_StoraygeGroupFromJson(json);

  @override
  final String sgId;
  @override
  final String? sgName;
  @override
  final String? sgDesc;
  @override
  final List<String?>? sgImgPathList;

  @override
  String toString() {
    return 'StoraygeGroup(sgId: $sgId, sgName: $sgName, sgDesc: $sgDesc, sgImgPathList: $sgImgPathList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoraygeGroup &&
            (identical(other.sgId, sgId) ||
                const DeepCollectionEquality().equals(other.sgId, sgId)) &&
            (identical(other.sgName, sgName) ||
                const DeepCollectionEquality().equals(other.sgName, sgName)) &&
            (identical(other.sgDesc, sgDesc) ||
                const DeepCollectionEquality().equals(other.sgDesc, sgDesc)) &&
            (identical(other.sgImgPathList, sgImgPathList) ||
                const DeepCollectionEquality()
                    .equals(other.sgImgPathList, sgImgPathList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sgId) ^
      const DeepCollectionEquality().hash(sgName) ^
      const DeepCollectionEquality().hash(sgDesc) ^
      const DeepCollectionEquality().hash(sgImgPathList);

  @JsonKey(ignore: true)
  @override
  _$StoraygeGroupCopyWith<_StoraygeGroup> get copyWith =>
      __$StoraygeGroupCopyWithImpl<_StoraygeGroup>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String sgId, String? sgName, String? sgDesc,
            List<String?>? sgImgPathList)
        $default, {
    required TResult Function(
            @JsonKey(name: "sgSnippet") List<StoraygeGroupSnippet> sgAllList)
        storaygeGroupAllList,
  }) {
    return $default(sgId, sgName, sgDesc, sgImgPathList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String sgId, String? sgName, String? sgDesc,
            List<String?>? sgImgPathList)?
        $default, {
    TResult Function(
            @JsonKey(name: "sgSnippet") List<StoraygeGroupSnippet> sgAllList)?
        storaygeGroupAllList,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(sgId, sgName, sgDesc, sgImgPathList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_StoraygeGroup value) $default, {
    required TResult Function(StoraygeGroupAllList value) storaygeGroupAllList,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_StoraygeGroup value)? $default, {
    TResult Function(StoraygeGroupAllList value)? storaygeGroupAllList,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoraygeGroupToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _StoraygeGroup extends StoraygeGroup {
  factory _StoraygeGroup(
      {required String sgId,
      required String? sgName,
      required String? sgDesc,
      required List<String?>? sgImgPathList}) = _$_StoraygeGroup;
  _StoraygeGroup._() : super._();

  factory _StoraygeGroup.fromJson(Map<String, dynamic> json) =
      _$_StoraygeGroup.fromJson;

  String get sgId => throw _privateConstructorUsedError;
  String? get sgName => throw _privateConstructorUsedError;
  String? get sgDesc => throw _privateConstructorUsedError;
  List<String?>? get sgImgPathList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$StoraygeGroupCopyWith<_StoraygeGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoraygeGroupAllListCopyWith<$Res> {
  factory $StoraygeGroupAllListCopyWith(StoraygeGroupAllList value,
          $Res Function(StoraygeGroupAllList) then) =
      _$StoraygeGroupAllListCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "sgSnippet") List<StoraygeGroupSnippet> sgAllList});
}

/// @nodoc
class _$StoraygeGroupAllListCopyWithImpl<$Res>
    extends _$StoraygeGroupCopyWithImpl<$Res>
    implements $StoraygeGroupAllListCopyWith<$Res> {
  _$StoraygeGroupAllListCopyWithImpl(
      StoraygeGroupAllList _value, $Res Function(StoraygeGroupAllList) _then)
      : super(_value, (v) => _then(v as StoraygeGroupAllList));

  @override
  StoraygeGroupAllList get _value => super._value as StoraygeGroupAllList;

  @override
  $Res call({
    Object? sgAllList = freezed,
  }) {
    return _then(StoraygeGroupAllList(
      sgAllList: sgAllList == freezed
          ? _value.sgAllList
          : sgAllList // ignore: cast_nullable_to_non_nullable
              as List<StoraygeGroupSnippet>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$StoraygeGroupAllList extends StoraygeGroupAllList {
  _$StoraygeGroupAllList({@JsonKey(name: "sgSnippet") required this.sgAllList})
      : super._();

  factory _$StoraygeGroupAllList.fromJson(Map<String, dynamic> json) =>
      _$_$StoraygeGroupAllListFromJson(json);

  @override
  @JsonKey(name: "sgSnippet")
  final List<StoraygeGroupSnippet> sgAllList;

  @override
  String toString() {
    return 'StoraygeGroup.storaygeGroupAllList(sgAllList: $sgAllList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StoraygeGroupAllList &&
            (identical(other.sgAllList, sgAllList) ||
                const DeepCollectionEquality()
                    .equals(other.sgAllList, sgAllList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(sgAllList);

  @JsonKey(ignore: true)
  @override
  $StoraygeGroupAllListCopyWith<StoraygeGroupAllList> get copyWith =>
      _$StoraygeGroupAllListCopyWithImpl<StoraygeGroupAllList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String sgId, String? sgName, String? sgDesc,
            List<String?>? sgImgPathList)
        $default, {
    required TResult Function(
            @JsonKey(name: "sgSnippet") List<StoraygeGroupSnippet> sgAllList)
        storaygeGroupAllList,
  }) {
    return storaygeGroupAllList(sgAllList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String sgId, String? sgName, String? sgDesc,
            List<String?>? sgImgPathList)?
        $default, {
    TResult Function(
            @JsonKey(name: "sgSnippet") List<StoraygeGroupSnippet> sgAllList)?
        storaygeGroupAllList,
    required TResult orElse(),
  }) {
    if (storaygeGroupAllList != null) {
      return storaygeGroupAllList(sgAllList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_StoraygeGroup value) $default, {
    required TResult Function(StoraygeGroupAllList value) storaygeGroupAllList,
  }) {
    return storaygeGroupAllList(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_StoraygeGroup value)? $default, {
    TResult Function(StoraygeGroupAllList value)? storaygeGroupAllList,
    required TResult orElse(),
  }) {
    if (storaygeGroupAllList != null) {
      return storaygeGroupAllList(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$StoraygeGroupAllListToJson(this)
      ..['runtimeType'] = 'storaygeGroupAllList';
  }
}

abstract class StoraygeGroupAllList extends StoraygeGroup {
  factory StoraygeGroupAllList(
          {@JsonKey(name: "sgSnippet")
              required List<StoraygeGroupSnippet> sgAllList}) =
      _$StoraygeGroupAllList;
  StoraygeGroupAllList._() : super._();

  factory StoraygeGroupAllList.fromJson(Map<String, dynamic> json) =
      _$StoraygeGroupAllList.fromJson;

  @JsonKey(name: "sgSnippet")
  List<StoraygeGroupSnippet> get sgAllList =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoraygeGroupAllListCopyWith<StoraygeGroupAllList> get copyWith =>
      throw _privateConstructorUsedError;
}

StoraygeGroupSnippet _$StoraygeGroupSnippetFromJson(Map<String, dynamic> json) {
  return _StoraygeGroupSnippet.fromJson(json);
}

/// @nodoc
class _$StoraygeGroupSnippetTearOff {
  const _$StoraygeGroupSnippetTearOff();

  _StoraygeGroupSnippet call(
      {required String sgId,
      required String sgName,
      required String sgDesc,
      required String sgImgPath}) {
    return _StoraygeGroupSnippet(
      sgId: sgId,
      sgName: sgName,
      sgDesc: sgDesc,
      sgImgPath: sgImgPath,
    );
  }

  StoraygeGroupSnippet fromJson(Map<String, Object> json) {
    return StoraygeGroupSnippet.fromJson(json);
  }
}

/// @nodoc
const $StoraygeGroupSnippet = _$StoraygeGroupSnippetTearOff();

/// @nodoc
mixin _$StoraygeGroupSnippet {
  String get sgId => throw _privateConstructorUsedError;
  String get sgName => throw _privateConstructorUsedError;
  String get sgDesc => throw _privateConstructorUsedError;
  String get sgImgPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoraygeGroupSnippetCopyWith<StoraygeGroupSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoraygeGroupSnippetCopyWith<$Res> {
  factory $StoraygeGroupSnippetCopyWith(StoraygeGroupSnippet value,
          $Res Function(StoraygeGroupSnippet) then) =
      _$StoraygeGroupSnippetCopyWithImpl<$Res>;
  $Res call({String sgId, String sgName, String sgDesc, String sgImgPath});
}

/// @nodoc
class _$StoraygeGroupSnippetCopyWithImpl<$Res>
    implements $StoraygeGroupSnippetCopyWith<$Res> {
  _$StoraygeGroupSnippetCopyWithImpl(this._value, this._then);

  final StoraygeGroupSnippet _value;
  // ignore: unused_field
  final $Res Function(StoraygeGroupSnippet) _then;

  @override
  $Res call({
    Object? sgId = freezed,
    Object? sgName = freezed,
    Object? sgDesc = freezed,
    Object? sgImgPath = freezed,
  }) {
    return _then(_value.copyWith(
      sgId: sgId == freezed
          ? _value.sgId
          : sgId // ignore: cast_nullable_to_non_nullable
              as String,
      sgName: sgName == freezed
          ? _value.sgName
          : sgName // ignore: cast_nullable_to_non_nullable
              as String,
      sgDesc: sgDesc == freezed
          ? _value.sgDesc
          : sgDesc // ignore: cast_nullable_to_non_nullable
              as String,
      sgImgPath: sgImgPath == freezed
          ? _value.sgImgPath
          : sgImgPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$StoraygeGroupSnippetCopyWith<$Res>
    implements $StoraygeGroupSnippetCopyWith<$Res> {
  factory _$StoraygeGroupSnippetCopyWith(_StoraygeGroupSnippet value,
          $Res Function(_StoraygeGroupSnippet) then) =
      __$StoraygeGroupSnippetCopyWithImpl<$Res>;
  @override
  $Res call({String sgId, String sgName, String sgDesc, String sgImgPath});
}

/// @nodoc
class __$StoraygeGroupSnippetCopyWithImpl<$Res>
    extends _$StoraygeGroupSnippetCopyWithImpl<$Res>
    implements _$StoraygeGroupSnippetCopyWith<$Res> {
  __$StoraygeGroupSnippetCopyWithImpl(
      _StoraygeGroupSnippet _value, $Res Function(_StoraygeGroupSnippet) _then)
      : super(_value, (v) => _then(v as _StoraygeGroupSnippet));

  @override
  _StoraygeGroupSnippet get _value => super._value as _StoraygeGroupSnippet;

  @override
  $Res call({
    Object? sgId = freezed,
    Object? sgName = freezed,
    Object? sgDesc = freezed,
    Object? sgImgPath = freezed,
  }) {
    return _then(_StoraygeGroupSnippet(
      sgId: sgId == freezed
          ? _value.sgId
          : sgId // ignore: cast_nullable_to_non_nullable
              as String,
      sgName: sgName == freezed
          ? _value.sgName
          : sgName // ignore: cast_nullable_to_non_nullable
              as String,
      sgDesc: sgDesc == freezed
          ? _value.sgDesc
          : sgDesc // ignore: cast_nullable_to_non_nullable
              as String,
      sgImgPath: sgImgPath == freezed
          ? _value.sgImgPath
          : sgImgPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoraygeGroupSnippet implements _StoraygeGroupSnippet {
  const _$_StoraygeGroupSnippet(
      {required this.sgId,
      required this.sgName,
      required this.sgDesc,
      required this.sgImgPath});

  factory _$_StoraygeGroupSnippet.fromJson(Map<String, dynamic> json) =>
      _$_$_StoraygeGroupSnippetFromJson(json);

  @override
  final String sgId;
  @override
  final String sgName;
  @override
  final String sgDesc;
  @override
  final String sgImgPath;

  @override
  String toString() {
    return 'StoraygeGroupSnippet(sgId: $sgId, sgName: $sgName, sgDesc: $sgDesc, sgImgPath: $sgImgPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoraygeGroupSnippet &&
            (identical(other.sgId, sgId) ||
                const DeepCollectionEquality().equals(other.sgId, sgId)) &&
            (identical(other.sgName, sgName) ||
                const DeepCollectionEquality().equals(other.sgName, sgName)) &&
            (identical(other.sgDesc, sgDesc) ||
                const DeepCollectionEquality().equals(other.sgDesc, sgDesc)) &&
            (identical(other.sgImgPath, sgImgPath) ||
                const DeepCollectionEquality()
                    .equals(other.sgImgPath, sgImgPath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sgId) ^
      const DeepCollectionEquality().hash(sgName) ^
      const DeepCollectionEquality().hash(sgDesc) ^
      const DeepCollectionEquality().hash(sgImgPath);

  @JsonKey(ignore: true)
  @override
  _$StoraygeGroupSnippetCopyWith<_StoraygeGroupSnippet> get copyWith =>
      __$StoraygeGroupSnippetCopyWithImpl<_StoraygeGroupSnippet>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoraygeGroupSnippetToJson(this);
  }
}

abstract class _StoraygeGroupSnippet implements StoraygeGroupSnippet {
  const factory _StoraygeGroupSnippet(
      {required String sgId,
      required String sgName,
      required String sgDesc,
      required String sgImgPath}) = _$_StoraygeGroupSnippet;

  factory _StoraygeGroupSnippet.fromJson(Map<String, dynamic> json) =
      _$_StoraygeGroupSnippet.fromJson;

  @override
  String get sgId => throw _privateConstructorUsedError;
  @override
  String get sgName => throw _privateConstructorUsedError;
  @override
  String get sgDesc => throw _privateConstructorUsedError;
  @override
  String get sgImgPath => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoraygeGroupSnippetCopyWith<_StoraygeGroupSnippet> get copyWith =>
      throw _privateConstructorUsedError;
}
