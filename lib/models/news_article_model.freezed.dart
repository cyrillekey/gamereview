// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_article_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Source _$SourceFromJson(Map<String, dynamic> json) {
  return _Source.fromJson(json);
}

/// @nodoc
class _$SourceTearOff {
  const _$SourceTearOff();

  _Source call(
      {@JsonKey(name: "id") String id = "",
      @JsonKey(name: "name") String name = "",
      @JsonKey(name: "description") String description = "",
      @JsonKey(name: "language") String language = ""}) {
    return _Source(
      id: id,
      name: name,
      description: description,
      language: language,
    );
  }

  Source fromJson(Map<String, Object?> json) {
    return Source.fromJson(json);
  }
}

/// @nodoc
const $Source = _$SourceTearOff();

/// @nodoc
mixin _$Source {
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "language")
  String get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceCopyWith<Source> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceCopyWith<$Res> {
  factory $SourceCopyWith(Source value, $Res Function(Source) then) =
      _$SourceCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "language") String language});
}

/// @nodoc
class _$SourceCopyWithImpl<$Res> implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._value, this._then);

  final Source _value;
  // ignore: unused_field
  final $Res Function(Source) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SourceCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$SourceCopyWith(_Source value, $Res Function(_Source) then) =
      __$SourceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "language") String language});
}

/// @nodoc
class __$SourceCopyWithImpl<$Res> extends _$SourceCopyWithImpl<$Res>
    implements _$SourceCopyWith<$Res> {
  __$SourceCopyWithImpl(_Source _value, $Res Function(_Source) _then)
      : super(_value, (v) => _then(v as _Source));

  @override
  _Source get _value => super._value as _Source;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? language = freezed,
  }) {
    return _then(_Source(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Source implements _Source {
  _$_Source(
      {@JsonKey(name: "id") this.id = "",
      @JsonKey(name: "name") this.name = "",
      @JsonKey(name: "description") this.description = "",
      @JsonKey(name: "language") this.language = ""});

  factory _$_Source.fromJson(Map<String, dynamic> json) =>
      _$$_SourceFromJson(json);

  @override
  @JsonKey(name: "id")
  final String id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "language")
  final String language;

  @override
  String toString() {
    return 'Source(id: $id, name: $name, description: $description, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Source &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, language);

  @JsonKey(ignore: true)
  @override
  _$SourceCopyWith<_Source> get copyWith =>
      __$SourceCopyWithImpl<_Source>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SourceToJson(this);
  }
}

abstract class _Source implements Source {
  factory _Source(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "language") String language}) = _$_Source;

  factory _Source.fromJson(Map<String, dynamic> json) = _$_Source.fromJson;

  @override
  @JsonKey(name: "id")
  String get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "language")
  String get language;
  @override
  @JsonKey(ignore: true)
  _$SourceCopyWith<_Source> get copyWith => throw _privateConstructorUsedError;
}

NewsArticleModel _$NewsArticleModelFromJson(Map<String, dynamic> json) {
  return _NewsArticleModel.fromJson(json);
}

/// @nodoc
class _$NewsArticleModelTearOff {
  const _$NewsArticleModelTearOff();

  _NewsArticleModel call(
      {@JsonKey(name: "author") String author = " ",
      @JsonKey(name: "title") String title = " ",
      @JsonKey(name: "description") String description = " ",
      @JsonKey(name: "url") String url = "url",
      @JsonKey(name: "urlToImage") String urlToUmage = "urlToImage",
      @JsonKey(name: "publishedAt") String publishedAt = "publishedAt",
      @JsonKey(name: "content") String content = " ",
      Source? source}) {
    return _NewsArticleModel(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToUmage: urlToUmage,
      publishedAt: publishedAt,
      content: content,
      source: source,
    );
  }

  NewsArticleModel fromJson(Map<String, Object?> json) {
    return NewsArticleModel.fromJson(json);
  }
}

/// @nodoc
const $NewsArticleModel = _$NewsArticleModelTearOff();

/// @nodoc
mixin _$NewsArticleModel {
  @JsonKey(name: "author")
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: "urlToImage")
  String get urlToUmage => throw _privateConstructorUsedError;
  @JsonKey(name: "publishedAt")
  String get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String get content => throw _privateConstructorUsedError;
  Source? get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsArticleModelCopyWith<NewsArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsArticleModelCopyWith<$Res> {
  factory $NewsArticleModelCopyWith(
          NewsArticleModel value, $Res Function(NewsArticleModel) then) =
      _$NewsArticleModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "author") String author,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "url") String url,
      @JsonKey(name: "urlToImage") String urlToUmage,
      @JsonKey(name: "publishedAt") String publishedAt,
      @JsonKey(name: "content") String content,
      Source? source});

  $SourceCopyWith<$Res>? get source;
}

/// @nodoc
class _$NewsArticleModelCopyWithImpl<$Res>
    implements $NewsArticleModelCopyWith<$Res> {
  _$NewsArticleModelCopyWithImpl(this._value, this._then);

  final NewsArticleModel _value;
  // ignore: unused_field
  final $Res Function(NewsArticleModel) _then;

  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlToUmage = freezed,
    Object? publishedAt = freezed,
    Object? content = freezed,
    Object? source = freezed,
  }) {
    return _then(_value.copyWith(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlToUmage: urlToUmage == freezed
          ? _value.urlToUmage
          : urlToUmage // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
    ));
  }

  @override
  $SourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

/// @nodoc
abstract class _$NewsArticleModelCopyWith<$Res>
    implements $NewsArticleModelCopyWith<$Res> {
  factory _$NewsArticleModelCopyWith(
          _NewsArticleModel value, $Res Function(_NewsArticleModel) then) =
      __$NewsArticleModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "author") String author,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "url") String url,
      @JsonKey(name: "urlToImage") String urlToUmage,
      @JsonKey(name: "publishedAt") String publishedAt,
      @JsonKey(name: "content") String content,
      Source? source});

  @override
  $SourceCopyWith<$Res>? get source;
}

/// @nodoc
class __$NewsArticleModelCopyWithImpl<$Res>
    extends _$NewsArticleModelCopyWithImpl<$Res>
    implements _$NewsArticleModelCopyWith<$Res> {
  __$NewsArticleModelCopyWithImpl(
      _NewsArticleModel _value, $Res Function(_NewsArticleModel) _then)
      : super(_value, (v) => _then(v as _NewsArticleModel));

  @override
  _NewsArticleModel get _value => super._value as _NewsArticleModel;

  @override
  $Res call({
    Object? author = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlToUmage = freezed,
    Object? publishedAt = freezed,
    Object? content = freezed,
    Object? source = freezed,
  }) {
    return _then(_NewsArticleModel(
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlToUmage: urlToUmage == freezed
          ? _value.urlToUmage
          : urlToUmage // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsArticleModel implements _NewsArticleModel {
  _$_NewsArticleModel(
      {@JsonKey(name: "author") this.author = " ",
      @JsonKey(name: "title") this.title = " ",
      @JsonKey(name: "description") this.description = " ",
      @JsonKey(name: "url") this.url = "url",
      @JsonKey(name: "urlToImage") this.urlToUmage = "urlToImage",
      @JsonKey(name: "publishedAt") this.publishedAt = "publishedAt",
      @JsonKey(name: "content") this.content = " ",
      this.source});

  factory _$_NewsArticleModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewsArticleModelFromJson(json);

  @override
  @JsonKey(name: "author")
  final String author;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "url")
  final String url;
  @override
  @JsonKey(name: "urlToImage")
  final String urlToUmage;
  @override
  @JsonKey(name: "publishedAt")
  final String publishedAt;
  @override
  @JsonKey(name: "content")
  final String content;
  @override
  final Source? source;

  @override
  String toString() {
    return 'NewsArticleModel(author: $author, title: $title, description: $description, url: $url, urlToUmage: $urlToUmage, publishedAt: $publishedAt, content: $content, source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsArticleModel &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.urlToUmage, urlToUmage) ||
                other.urlToUmage == urlToUmage) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, author, title, description, url,
      urlToUmage, publishedAt, content, source);

  @JsonKey(ignore: true)
  @override
  _$NewsArticleModelCopyWith<_NewsArticleModel> get copyWith =>
      __$NewsArticleModelCopyWithImpl<_NewsArticleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsArticleModelToJson(this);
  }
}

abstract class _NewsArticleModel implements NewsArticleModel {
  factory _NewsArticleModel(
      {@JsonKey(name: "author") String author,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "url") String url,
      @JsonKey(name: "urlToImage") String urlToUmage,
      @JsonKey(name: "publishedAt") String publishedAt,
      @JsonKey(name: "content") String content,
      Source? source}) = _$_NewsArticleModel;

  factory _NewsArticleModel.fromJson(Map<String, dynamic> json) =
      _$_NewsArticleModel.fromJson;

  @override
  @JsonKey(name: "author")
  String get author;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "url")
  String get url;
  @override
  @JsonKey(name: "urlToImage")
  String get urlToUmage;
  @override
  @JsonKey(name: "publishedAt")
  String get publishedAt;
  @override
  @JsonKey(name: "content")
  String get content;
  @override
  Source? get source;
  @override
  @JsonKey(ignore: true)
  _$NewsArticleModelCopyWith<_NewsArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
