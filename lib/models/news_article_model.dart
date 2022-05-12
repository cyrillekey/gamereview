import 'package:drift/drift.dart' show Expression, Insertable, Value;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamereview/database/local_db.dart';

part 'news_article_model.g.dart';
part 'news_article_model.freezed.dart';

@freezed
class Source with _$Source implements Insertable<Source> {
  const Source._();
  factory Source(
      {@JsonKey(name: "id") @Default("") String id,
      @JsonKey(name: "name") @Default("") String name,
      @JsonKey(name: "description") @Default("") String description,
      @JsonKey(name: "language") @Default("") String language}) = _Source;
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return SourceTableCompanion(
            id: Value(id),
            name: Value(name),
            description: Value(description),
            language: Value(language))
        .toColumns(nullToAbsent);
  }
}

@freezed
class NewsArticleModel
    with _$NewsArticleModel
    implements Insertable<NewsArticleModel> {
  const NewsArticleModel._();
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return NewsTableCompanion(
            author: Value(author),
            title: Value(title),
            description: Value(description),
            url: Value(url),
            urlToImage: Value(urlToUmage),
            publishedAt: Value(publishedAt))
        .toColumns(nullToAbsent);
  }
}
