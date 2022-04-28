// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Source _$$_SourceFromJson(Map<String, dynamic> json) => _$_Source(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      language: json['language'] as String? ?? "",
    );

Map<String, dynamic> _$$_SourceToJson(_$_Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
    };

_$_NewsArticleModel _$$_NewsArticleModelFromJson(Map<String, dynamic> json) =>
    _$_NewsArticleModel(
      author: json['author'] as String? ?? " ",
      title: json['title'] as String? ?? " ",
      description: json['description'] as String? ?? " ",
      url: json['url'] as String? ?? "url",
      urlToUmage: json['urlToImage'] as String? ?? "urlToImage",
      publishedAt: json['publishedAt'] as String? ?? "publishedAt",
      content: json['content'] as String? ?? " ",
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NewsArticleModelToJson(_$_NewsArticleModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToUmage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
      'source': instance.source,
    };
