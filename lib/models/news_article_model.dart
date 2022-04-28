import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_article_model.g.dart';
part 'news_article_model.freezed.dart';

@freezed
class Source with _$Source {
  factory Source(
      {@JsonKey(name: "id") @Default("") String id,
      @JsonKey(name: "name") @Default("") String name,
      @JsonKey(name: "description") @Default("") String description,
      @JsonKey(name: "language") @Default("") String language}) = _Source;
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

@freezed
class NewsArticleModel with _$NewsArticleModel {
  factory NewsArticleModel({
    @JsonKey(name: "author") @Default(" ") String author,
    @JsonKey(name: "title") @Default(" ") String title,
    @JsonKey(name: "description") @Default(" ") String description,
    @JsonKey(name: "url") @Default("url") String url,
    @JsonKey(name: "urlToImage") @Default("urlToImage") String urlToUmage,
    @JsonKey(name: "publishedAt") @Default("publishedAt") String publishedAt,
    @JsonKey(name: "content") @Default(" ") String content,
    Source? source,
  }) = _NewsArticleModel;
  factory NewsArticleModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleModelFromJson(json);
}
