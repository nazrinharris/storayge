// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return ItemData.fromJson(json);
}

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

  ItemData call(
      {required String? itemName,
      required String? itemDesc,
      required List<String?>? imgPath}) {
    return ItemData(
      itemName: itemName,
      itemDesc: itemDesc,
      imgPath: imgPath,
    );
  }

  Item fromJson(Map<String, Object> json) {
    return Item.fromJson(json);
  }
}

/// @nodoc
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  String? get itemName => throw _privateConstructorUsedError;
  String? get itemDesc => throw _privateConstructorUsedError;
  List<String?>? get imgPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call({String? itemName, String? itemDesc, List<String?>? imgPath});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? itemName = freezed,
    Object? itemDesc = freezed,
    Object? imgPath = freezed,
  }) {
    return _then(_value.copyWith(
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemDesc: itemDesc == freezed
          ? _value.itemDesc
          : itemDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      imgPath: imgPath == freezed
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
abstract class $ItemDataCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory $ItemDataCopyWith(ItemData value, $Res Function(ItemData) then) =
      _$ItemDataCopyWithImpl<$Res>;
  @override
  $Res call({String? itemName, String? itemDesc, List<String?>? imgPath});
}

/// @nodoc
class _$ItemDataCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements $ItemDataCopyWith<$Res> {
  _$ItemDataCopyWithImpl(ItemData _value, $Res Function(ItemData) _then)
      : super(_value, (v) => _then(v as ItemData));

  @override
  ItemData get _value => super._value as ItemData;

  @override
  $Res call({
    Object? itemName = freezed,
    Object? itemDesc = freezed,
    Object? imgPath = freezed,
  }) {
    return _then(ItemData(
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemDesc: itemDesc == freezed
          ? _value.itemDesc
          : itemDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      imgPath: imgPath == freezed
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ItemData with DiagnosticableTreeMixin implements ItemData {
  _$ItemData(
      {required this.itemName, required this.itemDesc, required this.imgPath});

  factory _$ItemData.fromJson(Map<String, dynamic> json) =>
      _$_$ItemDataFromJson(json);

  @override
  final String? itemName;
  @override
  final String? itemDesc;
  @override
  final List<String?>? imgPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(itemName: $itemName, itemDesc: $itemDesc, imgPath: $imgPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('itemName', itemName))
      ..add(DiagnosticsProperty('itemDesc', itemDesc))
      ..add(DiagnosticsProperty('imgPath', imgPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ItemData &&
            (identical(other.itemName, itemName) ||
                const DeepCollectionEquality()
                    .equals(other.itemName, itemName)) &&
            (identical(other.itemDesc, itemDesc) ||
                const DeepCollectionEquality()
                    .equals(other.itemDesc, itemDesc)) &&
            (identical(other.imgPath, imgPath) ||
                const DeepCollectionEquality().equals(other.imgPath, imgPath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(itemName) ^
      const DeepCollectionEquality().hash(itemDesc) ^
      const DeepCollectionEquality().hash(imgPath);

  @JsonKey(ignore: true)
  @override
  $ItemDataCopyWith<ItemData> get copyWith =>
      _$ItemDataCopyWithImpl<ItemData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$ItemDataToJson(this);
  }
}

abstract class ItemData implements Item {
  factory ItemData(
      {required String? itemName,
      required String? itemDesc,
      required List<String?>? imgPath}) = _$ItemData;

  factory ItemData.fromJson(Map<String, dynamic> json) = _$ItemData.fromJson;

  @override
  String? get itemName => throw _privateConstructorUsedError;
  @override
  String? get itemDesc => throw _privateConstructorUsedError;
  @override
  List<String?>? get imgPath => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $ItemDataCopyWith<ItemData> get copyWith =>
      throw _privateConstructorUsedError;
}
