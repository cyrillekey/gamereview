// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameDetails _$$_GameDetailsFromJson(Map<String, dynamic> json) =>
    _$_GameDetails(
      id: json['id'] as int? ?? 0,
      slug: json['slug'] as String? ?? "",
      name: json['name'] as String? ?? "",
      name_original: json['name_original'] as String? ?? "",
      description: json['description_raw'] as String? ?? "",
      metacritic: json['metacritic'] as int? ?? 0,
      released: json['released'] as String? ?? "",
      background_image: json['background_image'] as String? ?? "",
      website: json['website'] as String? ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      metacritic_url: json['metacritic_url'] as String? ?? " ",
      publisher: (json['publishers'] as List<dynamic>?)
              ?.map((e) => Publisher.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      developers: (json['developers'] as List<dynamic>?)
              ?.map((e) => Publisher.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      platforms: (json['platforms'] as List<dynamic>?)
              ?.map((e) => PlatformWrapper.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ratings: (json['ratings'] as List<dynamic>?)
              ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reviews_count: json['reviews_count'] as int? ?? 0,
      ratings_count: json['ratings_count'] as int? ?? 0,
      clip: json['clip'] as String? ?? "",
    );

Map<String, dynamic> _$$_GameDetailsToJson(_$_GameDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'name_original': instance.name_original,
      'description_raw': instance.description,
      'metacritic': instance.metacritic,
      'released': instance.released,
      'background_image': instance.background_image,
      'website': instance.website,
      'rating': instance.rating,
      'metacritic_url': instance.metacritic_url,
      'publishers': instance.publisher,
      'developers': instance.developers,
      'platforms': instance.platforms,
      'genres': instance.genres,
      'ratings': instance.ratings,
      'reviews_count': instance.reviews_count,
      'ratings_count': instance.ratings_count,
      'clip': instance.clip,
    };
