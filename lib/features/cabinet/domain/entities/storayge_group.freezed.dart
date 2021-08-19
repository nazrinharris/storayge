// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'storayge_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryageGroup _$StoryageGroupFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return StoraygeGroupData.fromJson(json);
    case 'snippet':
      return Snippet.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$StoryageGroupTearOff {
  const _$StoryageGroupTearOff();

  StoraygeGroupData call(
      {String? storaygeGroupName,
      String? storaygeGroupId,
      int? storaygeGroupAmount,
      int? itemAmount,
      String? storaygeGroupDesc,
      List<String?>? storaygeGroupImages,
      String? storaygeGroupPathName,
      List<StoryageGroup?>? storaygeGroupList,
      List<Item?>? itemList}) {
    return StoraygeGroupData(
      storaygeGroupName: storaygeGroupName,
      storaygeGroupId: storaygeGroupId,
      storaygeGroupAmount: storaygeGroupAmount,
      itemAmount: itemAmount,
      storaygeGroupDesc: storaygeGroupDesc,
      storaygeGroupImages: storaygeGroupImages,
      storaygeGroupPathName: storaygeGroupPathName,
      storaygeGroupList: storaygeGroupList,
      itemList: itemList,
    );
  }

  Snippet snippet({required String storaygeGroupId}) {
    return Snippet(
      storaygeGroupId: storaygeGroupId,
    );
  }

  StoryageGroup fromJson(Map<String, Object> json) {
    return StoryageGroup.fromJson(json);
  }
}

/// @nodoc
const $StoryageGroup = _$StoryageGroupTearOff();

/// @nodoc
mixin _$StoryageGroup {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? storaygeGroupName,
            String? storaygeGroupId,
            int? storaygeGroupAmount,
            int? itemAmount,
            String? storaygeGroupDesc,
            List<String?>? storaygeGroupImages,
            String? storaygeGroupPathName,
            List<StoryageGroup?>? storaygeGroupList,
            List<Item?>? itemList)
        $default, {
    required TResult Function(String storaygeGroupId) snippet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? storaygeGroupName,
            String? storaygeGroupId,
            int? storaygeGroupAmount,
            int? itemAmount,
            String? storaygeGroupDesc,
            List<String?>? storaygeGroupImages,
            String? storaygeGroupPathName,
            List<StoryageGroup?>? storaygeGroupList,
            List<Item?>? itemList)?
        $default, {
    TResult Function(String storaygeGroupId)? snippet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(StoraygeGroupData value) $default, {
    required TResult Function(Snippet value) snippet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(StoraygeGroupData value)? $default, {
    TResult Function(Snippet value)? snippet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryageGroupCopyWith<$Res> {
  factory $StoryageGroupCopyWith(
          StoryageGroup value, $Res Function(StoryageGroup) then) =
      _$StoryageGroupCopyWithImpl<$Res>;
}

/// @nodoc
class _$StoryageGroupCopyWithImpl<$Res>
    implements $StoryageGroupCopyWith<$Res> {
  _$StoryageGroupCopyWithImpl(this._value, this._then);

  final StoryageGroup _value;
  // ignore: unused_field
  final $Res Function(StoryageGroup) _then;
}

/// @nodoc
abstract class $StoraygeGroupDataCopyWith<$Res> {
  factory $StoraygeGroupDataCopyWith(
          StoraygeGroupData value, $Res Function(StoraygeGroupData) then) =
      _$StoraygeGroupDataCopyWithImpl<$Res>;
  $Res call(
      {String? storaygeGroupName,
      String? storaygeGroupId,
      int? storaygeGroupAmount,
      int? itemAmount,
      String? storaygeGroupDesc,
      List<String?>? storaygeGroupImages,
      String? storaygeGroupPathName,
      List<StoryageGroup?>? storaygeGroupList,
      List<Item?>? itemList});
}

/// @nodoc
class _$StoraygeGroupDataCopyWithImpl<$Res>
    extends _$StoryageGroupCopyWithImpl<$Res>
    implements $StoraygeGroupDataCopyWith<$Res> {
  _$StoraygeGroupDataCopyWithImpl(
      StoraygeGroupData _value, $Res Function(StoraygeGroupData) _then)
      : super(_value, (v) => _then(v as StoraygeGroupData));

  @override
  StoraygeGroupData get _value => super._value as StoraygeGroupData;

  @override
  $Res call({
    Object? storaygeGroupName = freezed,
    Object? storaygeGroupId = freezed,
    Object? storaygeGroupAmount = freezed,
    Object? itemAmount = freezed,
    Object? storaygeGroupDesc = freezed,
    Object? storaygeGroupImages = freezed,
    Object? storaygeGroupPathName = freezed,
    Object? storaygeGroupList = freezed,
    Object? itemList = freezed,
  }) {
    return _then(StoraygeGroupData(
      storaygeGroupName: storaygeGroupName == freezed
          ? _value.storaygeGroupName
          : storaygeGroupName // ignore: cast_nullable_to_non_nullable
              as String?,
      storaygeGroupId: storaygeGroupId == freezed
          ? _value.storaygeGroupId
          : storaygeGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      storaygeGroupAmount: storaygeGroupAmount == freezed
          ? _value.storaygeGroupAmount
          : storaygeGroupAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      itemAmount: itemAmount == freezed
          ? _value.itemAmount
          : itemAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      storaygeGroupDesc: storaygeGroupDesc == freezed
          ? _value.storaygeGroupDesc
          : storaygeGroupDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      storaygeGroupImages: storaygeGroupImages == freezed
          ? _value.storaygeGroupImages
          : storaygeGroupImages // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      storaygeGroupPathName: storaygeGroupPathName == freezed
          ? _value.storaygeGroupPathName
          : storaygeGroupPathName // ignore: cast_nullable_to_non_nullable
              as String?,
      storaygeGroupList: storaygeGroupList == freezed
          ? _value.storaygeGroupList
          : storaygeGroupList // ignore: cast_nullable_to_non_nullable
              as List<StoryageGroup?>?,
      itemList: itemList == freezed
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<Item?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$StoraygeGroupData
    with DiagnosticableTreeMixin
    implements StoraygeGroupData {
  const _$StoraygeGroupData(
      {this.storaygeGroupName,
      this.storaygeGroupId,
      this.storaygeGroupAmount,
      this.itemAmount,
      this.storaygeGroupDesc,
      this.storaygeGroupImages,
      this.storaygeGroupPathName,
      this.storaygeGroupList,
      this.itemList});

  factory _$StoraygeGroupData.fromJson(Map<String, dynamic> json) =>
      _$_$StoraygeGroupDataFromJson(json);

  @override
  final String? storaygeGroupName;
  @override
  final String? storaygeGroupId;
  @override
  final int? storaygeGroupAmount;
  @override
  final int? itemAmount;
  @override
  final String? storaygeGroupDesc;
  @override
  final List<String?>? storaygeGroupImages;
  @override
  final String? storaygeGroupPathName;
  @override
  final List<StoryageGroup?>? storaygeGroupList;
  @override
  final List<Item?>? itemList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryageGroup(storaygeGroupName: $storaygeGroupName, storaygeGroupId: $storaygeGroupId, storaygeGroupAmount: $storaygeGroupAmount, itemAmount: $itemAmount, storaygeGroupDesc: $storaygeGroupDesc, storaygeGroupImages: $storaygeGroupImages, storaygeGroupPathName: $storaygeGroupPathName, storaygeGroupList: $storaygeGroupList, itemList: $itemList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoryageGroup'))
      ..add(DiagnosticsProperty('storaygeGroupName', storaygeGroupName))
      ..add(DiagnosticsProperty('storaygeGroupId', storaygeGroupId))
      ..add(DiagnosticsProperty('storaygeGroupAmount', storaygeGroupAmount))
      ..add(DiagnosticsProperty('itemAmount', itemAmount))
      ..add(DiagnosticsProperty('storaygeGroupDesc', storaygeGroupDesc))
      ..add(DiagnosticsProperty('storaygeGroupImages', storaygeGroupImages))
      ..add(DiagnosticsProperty('storaygeGroupPathName', storaygeGroupPathName))
      ..add(DiagnosticsProperty('storaygeGroupList', storaygeGroupList))
      ..add(DiagnosticsProperty('itemList', itemList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StoraygeGroupData &&
            (identical(other.storaygeGroupName, storaygeGroupName) ||
                const DeepCollectionEquality()
                    .equals(other.storaygeGroupName, storaygeGroupName)) &&
            (identical(other.storaygeGroupId, storaygeGroupId) ||
                const DeepCollectionEquality()
                    .equals(other.storaygeGroupId, storaygeGroupId)) &&
            (identical(other.storaygeGroupAmount, storaygeGroupAmount) ||
                const DeepCollectionEquality()
                    .equals(other.storaygeGroupAmount, storaygeGroupAmount)) &&
            (identical(other.itemAmount, itemAmount) ||
                const DeepCollectionEquality()
                    .equals(other.itemAmount, itemAmount)) &&
            (identical(other.storaygeGroupDesc, storaygeGroupDesc) ||
                const DeepCollectionEquality()
                    .equals(other.storaygeGroupDesc, storaygeGroupDesc)) &&
            (identical(other.storaygeGroupImages, storaygeGroupImages) ||
                const DeepCollectionEquality()
                    .equals(other.storaygeGroupImages, storaygeGroupImages)) &&
            (identical(other.storaygeGroupPathName, storaygeGroupPathName) ||
                const DeepCollectionEquality().equals(
                    other.storaygeGroupPathName, storaygeGroupPathName)) &&
            (identical(other.storaygeGroupList, storaygeGroupList) ||
                const DeepCollectionEquality()
                    .equals(other.storaygeGroupList, storaygeGroupList)) &&
            (identical(other.itemList, itemList) ||
                const DeepCollectionEquality()
                    .equals(other.itemList, itemList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(storaygeGroupName) ^
      const DeepCollectionEquality().hash(storaygeGroupId) ^
      const DeepCollectionEquality().hash(storaygeGroupAmount) ^
      const DeepCollectionEquality().hash(itemAmount) ^
      const DeepCollectionEquality().hash(storaygeGroupDesc) ^
      const DeepCollectionEquality().hash(storaygeGroupImages) ^
      const DeepCollectionEquality().hash(storaygeGroupPathName) ^
      const DeepCollectionEquality().hash(storaygeGroupList) ^
      const DeepCollectionEquality().hash(itemList);

  @JsonKey(ignore: true)
  @override
  $StoraygeGroupDataCopyWith<StoraygeGroupData> get copyWith =>
      _$StoraygeGroupDataCopyWithImpl<StoraygeGroupData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? storaygeGroupName,
            String? storaygeGroupId,
            int? storaygeGroupAmount,
            int? itemAmount,
            String? storaygeGroupDesc,
            List<String?>? storaygeGroupImages,
            String? storaygeGroupPathName,
            List<StoryageGroup?>? storaygeGroupList,
            List<Item?>? itemList)
        $default, {
    required TResult Function(String storaygeGroupId) snippet,
  }) {
    return $default(
        storaygeGroupName,
        storaygeGroupId,
        storaygeGroupAmount,
        itemAmount,
        storaygeGroupDesc,
        storaygeGroupImages,
        storaygeGroupPathName,
        storaygeGroupList,
        itemList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? storaygeGroupName,
            String? storaygeGroupId,
            int? storaygeGroupAmount,
            int? itemAmount,
            String? storaygeGroupDesc,
            List<String?>? storaygeGroupImages,
            String? storaygeGroupPathName,
            List<StoryageGroup?>? storaygeGroupList,
            List<Item?>? itemList)?
        $default, {
    TResult Function(String storaygeGroupId)? snippet,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          storaygeGroupName,
          storaygeGroupId,
          storaygeGroupAmount,
          itemAmount,
          storaygeGroupDesc,
          storaygeGroupImages,
          storaygeGroupPathName,
          storaygeGroupList,
          itemList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(StoraygeGroupData value) $default, {
    required TResult Function(Snippet value) snippet,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(StoraygeGroupData value)? $default, {
    TResult Function(Snippet value)? snippet,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$StoraygeGroupDataToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class StoraygeGroupData implements StoryageGroup {
  const factory StoraygeGroupData(
      {String? storaygeGroupName,
      String? storaygeGroupId,
      int? storaygeGroupAmount,
      int? itemAmount,
      String? storaygeGroupDesc,
      List<String?>? storaygeGroupImages,
      String? storaygeGroupPathName,
      List<StoryageGroup?>? storaygeGroupList,
      List<Item?>? itemList}) = _$StoraygeGroupData;

  factory StoraygeGroupData.fromJson(Map<String, dynamic> json) =
      _$StoraygeGroupData.fromJson;

  String? get storaygeGroupName => throw _privateConstructorUsedError;
  String? get storaygeGroupId => throw _privateConstructorUsedError;
  int? get storaygeGroupAmount => throw _privateConstructorUsedError;
  int? get itemAmount => throw _privateConstructorUsedError;
  String? get storaygeGroupDesc => throw _privateConstructorUsedError;
  List<String?>? get storaygeGroupImages => throw _privateConstructorUsedError;
  String? get storaygeGroupPathName => throw _privateConstructorUsedError;
  List<StoryageGroup?>? get storaygeGroupList =>
      throw _privateConstructorUsedError;
  List<Item?>? get itemList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoraygeGroupDataCopyWith<StoraygeGroupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnippetCopyWith<$Res> {
  factory $SnippetCopyWith(Snippet value, $Res Function(Snippet) then) =
      _$SnippetCopyWithImpl<$Res>;
  $Res call({String storaygeGroupId});
}

/// @nodoc
class _$SnippetCopyWithImpl<$Res> extends _$StoryageGroupCopyWithImpl<$Res>
    implements $SnippetCopyWith<$Res> {
  _$SnippetCopyWithImpl(Snippet _value, $Res Function(Snippet) _then)
      : super(_value, (v) => _then(v as Snippet));

  @override
  Snippet get _value => super._value as Snippet;

  @override
  $Res call({
    Object? storaygeGroupId = freezed,
  }) {
    return _then(Snippet(
      storaygeGroupId: storaygeGroupId == freezed
          ? _value.storaygeGroupId
          : storaygeGroupId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Snippet with DiagnosticableTreeMixin implements Snippet {
  const _$Snippet({required this.storaygeGroupId});

  factory _$Snippet.fromJson(Map<String, dynamic> json) =>
      _$_$SnippetFromJson(json);

  @override
  final String storaygeGroupId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoryageGroup.snippet(storaygeGroupId: $storaygeGroupId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoryageGroup.snippet'))
      ..add(DiagnosticsProperty('storaygeGroupId', storaygeGroupId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Snippet &&
            (identical(other.storaygeGroupId, storaygeGroupId) ||
                const DeepCollectionEquality()
                    .equals(other.storaygeGroupId, storaygeGroupId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(storaygeGroupId);

  @JsonKey(ignore: true)
  @override
  $SnippetCopyWith<Snippet> get copyWith =>
      _$SnippetCopyWithImpl<Snippet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? storaygeGroupName,
            String? storaygeGroupId,
            int? storaygeGroupAmount,
            int? itemAmount,
            String? storaygeGroupDesc,
            List<String?>? storaygeGroupImages,
            String? storaygeGroupPathName,
            List<StoryageGroup?>? storaygeGroupList,
            List<Item?>? itemList)
        $default, {
    required TResult Function(String storaygeGroupId) snippet,
  }) {
    return snippet(storaygeGroupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? storaygeGroupName,
            String? storaygeGroupId,
            int? storaygeGroupAmount,
            int? itemAmount,
            String? storaygeGroupDesc,
            List<String?>? storaygeGroupImages,
            String? storaygeGroupPathName,
            List<StoryageGroup?>? storaygeGroupList,
            List<Item?>? itemList)?
        $default, {
    TResult Function(String storaygeGroupId)? snippet,
    required TResult orElse(),
  }) {
    if (snippet != null) {
      return snippet(storaygeGroupId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(StoraygeGroupData value) $default, {
    required TResult Function(Snippet value) snippet,
  }) {
    return snippet(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(StoraygeGroupData value)? $default, {
    TResult Function(Snippet value)? snippet,
    required TResult orElse(),
  }) {
    if (snippet != null) {
      return snippet(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$SnippetToJson(this)..['runtimeType'] = 'snippet';
  }
}

abstract class Snippet implements StoryageGroup {
  const factory Snippet({required String storaygeGroupId}) = _$Snippet;

  factory Snippet.fromJson(Map<String, dynamic> json) = _$Snippet.fromJson;

  String get storaygeGroupId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnippetCopyWith<Snippet> get copyWith => throw _privateConstructorUsedError;
}
