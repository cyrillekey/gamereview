// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      id: json['id'] as int? ?? 0,
      slug: json['slug'] as String? ?? "",
      name: json['name'] as String? ?? " ",
      released: json['released'] as String? ?? " ",
      background_image: json['background_image'] as String? ?? " ",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      rating_top: json['rating_top'] as int? ?? 5,
      ratings: (json['ratings'] as List<dynamic>?)
              ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metacritic: json['metacritic'] as int? ?? 0,
      reviews_count: json['reviews_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'released': instance.released,
      'background_image': instance.background_image,
      'rating': instance.rating,
      'rating_top': instance.rating_top,
      'ratings': instance.ratings,
      'metacritic': instance.metacritic,
      'reviews_count': instance.reviews_count,
    };
