// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantImpl _$$PlantImplFromJson(Map<String, dynamic> json) => _$PlantImpl(
      id: json['id'] as String?,
      idUser: json['idUser'] as String?,
      name: json['name'] as String?,
      beginAt: json['beginAt'] as String?,
      endAt: json['endAt'] as String?,
      description: json['description'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$$PlantImplToJson(_$PlantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'name': instance.name,
      'beginAt': instance.beginAt,
      'endAt': instance.endAt,
      'description': instance.description,
      'picture': instance.picture,
    };
