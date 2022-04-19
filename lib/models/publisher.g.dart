// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Publisher _$$_PublisherFromJson(Map<String, dynamic> json) => _$_Publisher(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      slug: json['slug'] as String? ?? "",
      games_count: json['games_count'] as int? ?? 0,
      image_background: json['image_background'] as String? ?? "",
    );

Map<String, dynamic> _$$_PublisherToJson(_$_Publisher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'games_count': instance.games_count,
      'image_background': instance.image_background,
    };
