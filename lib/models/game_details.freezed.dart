// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameDetails _$GameDetailsFromJson(Map<String, dynamic> json) {
  return _GameDetails.fromJson(json);
}

/// @nodoc
class _$GameDetailsTearOff {
  const _$GameDetailsTearOff();

  _GameDetails call(
      {@JsonKey(name: "id") int id = 0,
      @JsonKey(name: "slug") String slug = "",
      @JsonKey(name: "name") String name = "",
      @JsonKey(name: "name_original") String name_original = "",
      @JsonKey(name: "description_raw") String description = "",
      @JsonKey(name: "metacritic") int metacritic = 0,
      @JsonKey(name: "released") String released = "",
      @JsonKey(name: "background_image") String background_image = "",
      @JsonKey(name: "website") String website = "",
      @JsonKey(name: "rating") double rating = 0.0,
      @JsonKey(name: "metacritic_url") String metacritic_url = " ",
      @JsonKey(name: "publishers") List<Publisher> publisher = const [],
      @JsonKey(name: "developers") List<Publisher> developers = const [],
      @JsonKey(name: "platforms") List<PlatformWrapper> platforms = const [],
      @JsonKey(name: 'genres') List<Genre> genres = const []}) {
    return _GameDetails(
      id: id,
      slug: slug,
      name: name,
      name_original: name_original,
      description: description,
      metacritic: metacritic,
      released: released,
      background_image: background_image,
      website: website,
      rating: rating,
      metacritic_url: metacritic_url,
      publisher: publisher,
      developers: developers,
      platforms: platforms,
      genres: genres,
    );
  }

  GameDetails fromJson(Map<String, Object?> json) {
    return GameDetails.fromJson(json);
  }
}

/// @nodoc
const $GameDetails = _$GameDetailsTearOff();

/// @nodoc
mixin _$GameDetails {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "name_original")
  String get name_original => throw _privateConstructorUsedError;
  @JsonKey(name: "description_raw")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "metacritic")
  int get metacritic => throw _privateConstructorUsedError;
  @JsonKey(name: "released")
  String get released => throw _privateConstructorUsedError;
  @JsonKey(name: "background_image")
  String get background_image => throw _privateConstructorUsedError;
  @JsonKey(name: "website")
  String get website => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "metacritic_url")
  String get metacritic_url => throw _privateConstructorUsedError;
  @JsonKey(name: "publishers")
  List<Publisher> get publisher => throw _privateConstructorUsedError;
  @JsonKey(name: "developers")
  List<Publisher> get developers => throw _privateConstructorUsedError;
  @JsonKey(name: "platforms")
  List<PlatformWrapper> get platforms => throw _privateConstructorUsedError;
  @JsonKey(name: 'genres')
  List<Genre> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameDetailsCopyWith<GameDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDetailsCopyWith<$Res> {
  factory $GameDetailsCopyWith(
          GameDetails value, $Res Function(GameDetails) then) =
      _$GameDetailsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "name_original") String name_original,
      @JsonKey(name: "description_raw") String description,
      @JsonKey(name: "metacritic") int metacritic,
      @JsonKey(name: "released") String released,
      @JsonKey(name: "background_image") String background_image,
      @JsonKey(name: "website") String website,
      @JsonKey(name: "rating") double rating,
      @JsonKey(name: "metacritic_url") String metacritic_url,
      @JsonKey(name: "publishers") List<Publisher> publisher,
      @JsonKey(name: "developers") List<Publisher> developers,
      @JsonKey(name: "platforms") List<PlatformWrapper> platforms,
      @JsonKey(name: 'genres') List<Genre> genres});
}

/// @nodoc
class _$GameDetailsCopyWithImpl<$Res> implements $GameDetailsCopyWith<$Res> {
  _$GameDetailsCopyWithImpl(this._value, this._then);

  final GameDetails _value;
  // ignore: unused_field
  final $Res Function(GameDetails) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? name_original = freezed,
    Object? description = freezed,
    Object? metacritic = freezed,
    Object? released = freezed,
    Object? background_image = freezed,
    Object? website = freezed,
    Object? rating = freezed,
    Object? metacritic_url = freezed,
    Object? publisher = freezed,
    Object? developers = freezed,
    Object? platforms = freezed,
    Object? genres = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      name_original: name_original == freezed
          ? _value.name_original
          : name_original // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      metacritic: metacritic == freezed
          ? _value.metacritic
          : metacritic // ignore: cast_nullable_to_non_nullable
              as int,
      released: released == freezed
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String,
      background_image: background_image == freezed
          ? _value.background_image
          : background_image // ignore: cast_nullable_to_non_nullable
              as String,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      metacritic_url: metacritic_url == freezed
          ? _value.metacritic_url
          : metacritic_url // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as List<Publisher>,
      developers: developers == freezed
          ? _value.developers
          : developers // ignore: cast_nullable_to_non_nullable
              as List<Publisher>,
      platforms: platforms == freezed
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<PlatformWrapper>,
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc
abstract class _$GameDetailsCopyWith<$Res>
    implements $GameDetailsCopyWith<$Res> {
  factory _$GameDetailsCopyWith(
          _GameDetails value, $Res Function(_GameDetails) then) =
      __$GameDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "name_original") String name_original,
      @JsonKey(name: "description_raw") String description,
      @JsonKey(name: "metacritic") int metacritic,
      @JsonKey(name: "released") String released,
      @JsonKey(name: "background_image") String background_image,
      @JsonKey(name: "website") String website,
      @JsonKey(name: "rating") double rating,
      @JsonKey(name: "metacritic_url") String metacritic_url,
      @JsonKey(name: "publishers") List<Publisher> publisher,
      @JsonKey(name: "developers") List<Publisher> developers,
      @JsonKey(name: "platforms") List<PlatformWrapper> platforms,
      @JsonKey(name: 'genres') List<Genre> genres});
}

/// @nodoc
class __$GameDetailsCopyWithImpl<$Res> extends _$GameDetailsCopyWithImpl<$Res>
    implements _$GameDetailsCopyWith<$Res> {
  __$GameDetailsCopyWithImpl(
      _GameDetails _value, $Res Function(_GameDetails) _then)
      : super(_value, (v) => _then(v as _GameDetails));

  @override
  _GameDetails get _value => super._value as _GameDetails;

  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? name_original = freezed,
    Object? description = freezed,
    Object? metacritic = freezed,
    Object? released = freezed,
    Object? background_image = freezed,
    Object? website = freezed,
    Object? rating = freezed,
    Object? metacritic_url = freezed,
    Object? publisher = freezed,
    Object? developers = freezed,
    Object? platforms = freezed,
    Object? genres = freezed,
  }) {
    return _then(_GameDetails(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      name_original: name_original == freezed
          ? _value.name_original
          : name_original // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      metacritic: metacritic == freezed
          ? _value.metacritic
          : metacritic // ignore: cast_nullable_to_non_nullable
              as int,
      released: released == freezed
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String,
      background_image: background_image == freezed
          ? _value.background_image
          : background_image // ignore: cast_nullable_to_non_nullable
              as String,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      metacritic_url: metacritic_url == freezed
          ? _value.metacritic_url
          : metacritic_url // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as List<Publisher>,
      developers: developers == freezed
          ? _value.developers
          : developers // ignore: cast_nullable_to_non_nullable
              as List<Publisher>,
      platforms: platforms == freezed
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<PlatformWrapper>,
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameDetails implements _GameDetails {
  _$_GameDetails(
      {@JsonKey(name: "id") this.id = 0,
      @JsonKey(name: "slug") this.slug = "",
      @JsonKey(name: "name") this.name = "",
      @JsonKey(name: "name_original") this.name_original = "",
      @JsonKey(name: "description_raw") this.description = "",
      @JsonKey(name: "metacritic") this.metacritic = 0,
      @JsonKey(name: "released") this.released = "",
      @JsonKey(name: "background_image") this.background_image = "",
      @JsonKey(name: "website") this.website = "",
      @JsonKey(name: "rating") this.rating = 0.0,
      @JsonKey(name: "metacritic_url") this.metacritic_url = " ",
      @JsonKey(name: "publishers") this.publisher = const [],
      @JsonKey(name: "developers") this.developers = const [],
      @JsonKey(name: "platforms") this.platforms = const [],
      @JsonKey(name: 'genres') this.genres = const []});

  factory _$_GameDetails.fromJson(Map<String, dynamic> json) =>
      _$$_GameDetailsFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "slug")
  final String slug;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "name_original")
  final String name_original;
  @override
  @JsonKey(name: "description_raw")
  final String description;
  @override
  @JsonKey(name: "metacritic")
  final int metacritic;
  @override
  @JsonKey(name: "released")
  final String released;
  @override
  @JsonKey(name: "background_image")
  final String background_image;
  @override
  @JsonKey(name: "website")
  final String website;
  @override
  @JsonKey(name: "rating")
  final double rating;
  @override
  @JsonKey(name: "metacritic_url")
  final String metacritic_url;
  @override
  @JsonKey(name: "publishers")
  final List<Publisher> publisher;
  @override
  @JsonKey(name: "developers")
  final List<Publisher> developers;
  @override
  @JsonKey(name: "platforms")
  final List<PlatformWrapper> platforms;
  @override
  @JsonKey(name: 'genres')
  final List<Genre> genres;

  @override
  String toString() {
    return 'GameDetails(id: $id, slug: $slug, name: $name, name_original: $name_original, description: $description, metacritic: $metacritic, released: $released, background_image: $background_image, website: $website, rating: $rating, metacritic_url: $metacritic_url, publisher: $publisher, developers: $developers, platforms: $platforms, genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.name_original, name_original) ||
                other.name_original == name_original) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.metacritic, metacritic) ||
                other.metacritic == metacritic) &&
            (identical(other.released, released) ||
                other.released == released) &&
            (identical(other.background_image, background_image) ||
                other.background_image == background_image) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.metacritic_url, metacritic_url) ||
                other.metacritic_url == metacritic_url) &&
            const DeepCollectionEquality().equals(other.publisher, publisher) &&
            const DeepCollectionEquality()
                .equals(other.developers, developers) &&
            const DeepCollectionEquality().equals(other.platforms, platforms) &&
            const DeepCollectionEquality().equals(other.genres, genres));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      slug,
      name,
      name_original,
      description,
      metacritic,
      released,
      background_image,
      website,
      rating,
      metacritic_url,
      const DeepCollectionEquality().hash(publisher),
      const DeepCollectionEquality().hash(developers),
      const DeepCollectionEquality().hash(platforms),
      const DeepCollectionEquality().hash(genres));

  @JsonKey(ignore: true)
  @override
  _$GameDetailsCopyWith<_GameDetails> get copyWith =>
      __$GameDetailsCopyWithImpl<_GameDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameDetailsToJson(this);
  }
}

abstract class _GameDetails implements GameDetails {
  factory _GameDetails(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "name_original") String name_original,
      @JsonKey(name: "description_raw") String description,
      @JsonKey(name: "metacritic") int metacritic,
      @JsonKey(name: "released") String released,
      @JsonKey(name: "background_image") String background_image,
      @JsonKey(name: "website") String website,
      @JsonKey(name: "rating") double rating,
      @JsonKey(name: "metacritic_url") String metacritic_url,
      @JsonKey(name: "publishers") List<Publisher> publisher,
      @JsonKey(name: "developers") List<Publisher> developers,
      @JsonKey(name: "platforms") List<PlatformWrapper> platforms,
      @JsonKey(name: 'genres') List<Genre> genres}) = _$_GameDetails;

  factory _GameDetails.fromJson(Map<String, dynamic> json) =
      _$_GameDetails.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "slug")
  String get slug;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "name_original")
  String get name_original;
  @override
  @JsonKey(name: "description_raw")
  String get description;
  @override
  @JsonKey(name: "metacritic")
  int get metacritic;
  @override
  @JsonKey(name: "released")
  String get released;
  @override
  @JsonKey(name: "background_image")
  String get background_image;
  @override
  @JsonKey(name: "website")
  String get website;
  @override
  @JsonKey(name: "rating")
  double get rating;
  @override
  @JsonKey(name: "metacritic_url")
  String get metacritic_url;
  @override
  @JsonKey(name: "publishers")
  List<Publisher> get publisher;
  @override
  @JsonKey(name: "developers")
  List<Publisher> get developers;
  @override
  @JsonKey(name: "platforms")
  List<PlatformWrapper> get platforms;
  @override
  @JsonKey(name: 'genres')
  List<Genre> get genres;
  @override
  @JsonKey(ignore: true)
  _$GameDetailsCopyWith<_GameDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
