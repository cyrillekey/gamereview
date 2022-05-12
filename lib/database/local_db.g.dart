// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GameTableCompanion extends UpdateCompanion<Game> {
  final Value<int> id;
  final Value<String> slug;
  final Value<String> name;
  final Value<String> released;
  final Value<String> background_image;
  final Value<double> rating;
  final Value<int> rating_top;
  final Value<int> metacritic;
  const GameTableCompanion({
    this.id = const Value.absent(),
    this.slug = const Value.absent(),
    this.name = const Value.absent(),
    this.released = const Value.absent(),
    this.background_image = const Value.absent(),
    this.rating = const Value.absent(),
    this.rating_top = const Value.absent(),
    this.metacritic = const Value.absent(),
  });
  GameTableCompanion.insert({
    this.id = const Value.absent(),
    required String slug,
    required String name,
    required String released,
    required String background_image,
    required double rating,
    required int rating_top,
    required int metacritic,
  })  : slug = Value(slug),
        name = Value(name),
        released = Value(released),
        background_image = Value(background_image),
        rating = Value(rating),
        rating_top = Value(rating_top),
        metacritic = Value(metacritic);
  static Insertable<Game> custom({
    Expression<int>? id,
    Expression<String>? slug,
    Expression<String>? name,
    Expression<String>? released,
    Expression<String>? background_image,
    Expression<double>? rating,
    Expression<int>? rating_top,
    Expression<int>? metacritic,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (slug != null) 'slug': slug,
      if (name != null) 'name': name,
      if (released != null) 'released': released,
      if (background_image != null) 'background_image': background_image,
      if (rating != null) 'rating': rating,
      if (rating_top != null) 'rating_top': rating_top,
      if (metacritic != null) 'metacritic': metacritic,
    });
  }

  GameTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? slug,
      Value<String>? name,
      Value<String>? released,
      Value<String>? background_image,
      Value<double>? rating,
      Value<int>? rating_top,
      Value<int>? metacritic}) {
    return GameTableCompanion(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      released: released ?? this.released,
      background_image: background_image ?? this.background_image,
      rating: rating ?? this.rating,
      rating_top: rating_top ?? this.rating_top,
      metacritic: metacritic ?? this.metacritic,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (released.present) {
      map['released'] = Variable<String>(released.value);
    }
    if (background_image.present) {
      map['background_image'] = Variable<String>(background_image.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (rating_top.present) {
      map['rating_top'] = Variable<int>(rating_top.value);
    }
    if (metacritic.present) {
      map['metacritic'] = Variable<int>(metacritic.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameTableCompanion(')
          ..write('id: $id, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('released: $released, ')
          ..write('background_image: $background_image, ')
          ..write('rating: $rating, ')
          ..write('rating_top: $rating_top, ')
          ..write('metacritic: $metacritic')
          ..write(')'))
        .toString();
  }
}

class $GameTableTable extends GameTable with TableInfo<$GameTableTable, Game> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String?> slug = GeneratedColumn<String?>(
      'slug', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _releasedMeta = const VerificationMeta('released');
  @override
  late final GeneratedColumn<String?> released = GeneratedColumn<String?>(
      'released', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _background_imageMeta =
      const VerificationMeta('background_image');
  @override
  late final GeneratedColumn<String?> background_image =
      GeneratedColumn<String?>('background_image', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double?> rating = GeneratedColumn<double?>(
      'rating', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _rating_topMeta = const VerificationMeta('rating_top');
  @override
  late final GeneratedColumn<int?> rating_top = GeneratedColumn<int?>(
      'rating_top', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _metacriticMeta = const VerificationMeta('metacritic');
  @override
  late final GeneratedColumn<int?> metacritic = GeneratedColumn<int?>(
      'metacritic', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        slug,
        name,
        released,
        background_image,
        rating,
        rating_top,
        metacritic
      ];
  @override
  String get aliasedName => _alias ?? 'game_table';
  @override
  String get actualTableName => 'game_table';
  @override
  VerificationContext validateIntegrity(Insertable<Game> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug']!, _slugMeta));
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('released')) {
      context.handle(_releasedMeta,
          released.isAcceptableOrUnknown(data['released']!, _releasedMeta));
    } else if (isInserting) {
      context.missing(_releasedMeta);
    }
    if (data.containsKey('background_image')) {
      context.handle(
          _background_imageMeta,
          background_image.isAcceptableOrUnknown(
              data['background_image']!, _background_imageMeta));
    } else if (isInserting) {
      context.missing(_background_imageMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('rating_top')) {
      context.handle(
          _rating_topMeta,
          rating_top.isAcceptableOrUnknown(
              data['rating_top']!, _rating_topMeta));
    } else if (isInserting) {
      context.missing(_rating_topMeta);
    }
    if (data.containsKey('metacritic')) {
      context.handle(
          _metacriticMeta,
          metacritic.isAcceptableOrUnknown(
              data['metacritic']!, _metacriticMeta));
    } else if (isInserting) {
      context.missing(_metacriticMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Game map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Game(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      slug: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}slug'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      released: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}released'])!,
      background_image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}background_image'])!,
      rating: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
      rating_top: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating_top'])!,
      metacritic: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}metacritic'])!,
    );
  }

  @override
  $GameTableTable createAlias(String alias) {
    return $GameTableTable(attachedDatabase, alias);
  }
}

class SourceTableCompanion extends UpdateCompanion<Source> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> language;
  const SourceTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
  });
  SourceTableCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String language,
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        language = Value(language);
  static Insertable<Source> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? language,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (language != null) 'language': language,
    });
  }

  SourceTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? language}) {
    return SourceTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourceTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }
}

class $SourceTableTable extends SourceTable
    with TableInfo<$SourceTableTable, Source> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _languageMeta = const VerificationMeta('language');
  @override
  late final GeneratedColumn<String?> language = GeneratedColumn<String?>(
      'language', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, language];
  @override
  String get aliasedName => _alias ?? 'source_table';
  @override
  String get actualTableName => 'source_table';
  @override
  VerificationContext validateIntegrity(Insertable<Source> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Source map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Source(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      language: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}language'])!,
    );
  }

  @override
  $SourceTableTable createAlias(String alias) {
    return $SourceTableTable(attachedDatabase, alias);
  }
}

class NewsTableCompanion extends UpdateCompanion<NewsArticleModel> {
  final Value<String> author;
  final Value<String> title;
  final Value<String> description;
  final Value<String> url;
  final Value<String> urlToImage;
  final Value<String> publishedAt;
  const NewsTableCompanion({
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
  });
  NewsTableCompanion.insert({
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
  })  : author = Value(author),
        title = Value(title),
        description = Value(description),
        url = Value(url),
        urlToImage = Value(urlToImage),
        publishedAt = Value(publishedAt);
  static Insertable<NewsArticleModel> custom({
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? publishedAt,
  }) {
    return RawValuesInsertable({
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishedAt != null) 'published_at': publishedAt,
    });
  }

  NewsTableCompanion copyWith(
      {Value<String>? author,
      Value<String>? title,
      Value<String>? description,
      Value<String>? url,
      Value<String>? urlToImage,
      Value<String>? publishedAt}) {
    return NewsTableCompanion(
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsTableCompanion(')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt')
          ..write(')'))
        .toString();
  }
}

class $NewsTableTable extends NewsTable
    with TableInfo<$NewsTableTable, NewsArticleModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlToImageMeta = const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String?> urlToImage = GeneratedColumn<String?>(
      'url_to_image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<String?> publishedAt = GeneratedColumn<String?>(
      'published_at', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [author, title, description, url, urlToImage, publishedAt];
  @override
  String get aliasedName => _alias ?? 'news_table';
  @override
  String get actualTableName => 'news_table';
  @override
  VerificationContext validateIntegrity(Insertable<NewsArticleModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  NewsArticleModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsArticleModel(
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      publishedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}published_at'])!,
    );
  }

  @override
  $NewsTableTable createAlias(String alias) {
    return $NewsTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GameTableTable gameTable = $GameTableTable(this);
  late final $SourceTableTable sourceTable = $SourceTableTable(this);
  late final $NewsTableTable newsTable = $NewsTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [gameTable, sourceTable, newsTable];
}
