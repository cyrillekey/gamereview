// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Platform _$$_PlatformFromJson(Map<String, dynamic> json) => _$_Platform(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      image: json['slug'] as String? ?? "",
      games_count: json['games_count'] as int? ?? 0,
      image_background: json['image_background'] as String? ?? "",
    );

Map<String, dynamic> _$$_PlatformToJson(_$_Platform instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.image,
      'games_count': instance.games_count,
      'image_background': instance.image_background,
    };

_$_PlatformWrapper _$$_PlatformWrapperFromJson(Map<String, dynamic> json) =>
    _$_PlatformWrapper(
      platform: json['platform'] == null
          ? null
          : Platform.fromJson(json['platform'] as Map<String, dynamic>),
      released_at: json['released_at'] as String? ?? "",
    );

Map<String, dynamic> _$$_PlatformWrapperToJson(_$_PlatformWrapper instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'released_at': instance.released_at,
    };
