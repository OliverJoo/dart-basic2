// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      address: json['address'] as String,
      name: json['name'] as String,
      stock: json['stock'] as String,
      type: json['type'] as int,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'stock': instance.stock,
      'type': instance.type,
    };
