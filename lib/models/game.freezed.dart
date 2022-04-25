// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
class _$GameTearOff {
  const _$GameTearOff();

  _Game call(
      {@JsonKey(name: "id") int id = 0,
      @JsonKey(name: "slug") String slug = "",
      @JsonKey(name: "name") String name = " ",
      @JsonKey(name: "released") String released = " ",
      @JsonKey(name: "background_image") String background_image = " ",
      @JsonKey(name: "rating") double rating = 0.0,
      @JsonKey(name: "rating_top") int rating_top = 5,
      @JsonKey(name: "ratings") List<Rating> ratings = const [],
      @JsonKey(name: "metacritic") int metacritic = 0,
      @JsonKey(name: "reviews_count") int reviews_count = 0,
      @JsonKey(name: "genres") List<Genre> genres = const []}) {
    return _Game(
      id: id,
      slug: slug,
      name: name,
      released: released,
      background_image: background_image,
      rating: rating,
      rating_top: rating_top,
      ratings: ratings,
      metacritic: metacritic,
      reviews_count: reviews_count,
      genres: genres,
    );
  }

  Game fromJson(Map<String, Object?> json) {
    return Game.fromJson(json);
  }
}

/// @nodoc
const $Game = _$GameTearOff();

/// @nodoc
mixin _$Game {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "released")
  String get released => throw _privateConstructorUsedError;
  @JsonKey(name: "background_image")
  String get background_image => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "rating_top")
  int get rating_top => throw _privateConstructorUsedError;
  @JsonKey(name: "ratings")
  List<Rating> get ratings => throw _privateConstructorUsedError;
  @JsonKey(name: "metacritic")
  int get metacritic => throw _privateConstructorUsedError;
  @JsonKey(name: "reviews_count")
  int get reviews_count => throw _privateConstructorUsedError;
  @JsonKey(name: "genres")
  List<Genre> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "released") String released,
      @JsonKey(name: "background_image") String background_image,
      @JsonKey(name: "rating") double rating,
      @JsonKey(name: "rating_top") int rating_top,
      @JsonKey(name: "ratings") List<Rating> ratings,
      @JsonKey(name: "metacritic") int metacritic,
      @JsonKey(name: "reviews_count") int reviews_count,
      @JsonKey(name: "genres") List<Genre> genres});
}

/// @nodoc
class _$GameCopyWithImpl<$Res> implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  final Game _value;
  // ignore: unused_field
  final $Res Function(Game) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? released = freezed,
    Object? background_image = freezed,
    Object? rating = freezed,
    Object? rating_top = freezed,
    Object? ratings = freezed,
    Object? metacritic = freezed,
    Object? reviews_count = freezed,
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
      released: released == freezed
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String,
      background_image: background_image == freezed
          ? _value.background_image
          : background_image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      rating_top: rating_top == freezed
          ? _value.rating_top
          : rating_top // ignore: cast_nullable_to_non_nullable
              as int,
      ratings: ratings == freezed
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<Rating>,
      metacritic: metacritic == freezed
          ? _value.metacritic
          : metacritic // ignore: cast_nullable_to_non_nullable
              as int,
      reviews_count: reviews_count == freezed
          ? _value.reviews_count
          : reviews_count // ignore: cast_nullable_to_non_nullable
              as int,
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc
abstract class _$GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) then) =
      __$GameCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "released") String released,
      @JsonKey(name: "background_image") String background_image,
      @JsonKey(name: "rating") double rating,
      @JsonKey(name: "rating_top") int rating_top,
      @JsonKey(name: "ratings") List<Rating> ratings,
      @JsonKey(name: "metacritic") int metacritic,
      @JsonKey(name: "reviews_count") int reviews_count,
      @JsonKey(name: "genres") List<Genre> genres});
}

/// @nodoc
class __$GameCopyWithImpl<$Res> extends _$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(_Game _value, $Res Function(_Game) _then)
      : super(_value, (v) => _then(v as _Game));

  @override
  _Game get _value => super._value as _Game;

  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? released = freezed,
    Object? background_image = freezed,
    Object? rating = freezed,
    Object? rating_top = freezed,
    Object? ratings = freezed,
    Object? metacritic = freezed,
    Object? reviews_count = freezed,
    Object? genres = freezed,
  }) {
    return _then(_Game(
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
      released: released == freezed
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String,
      background_image: background_image == freezed
          ? _value.background_image
          : background_image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      rating_top: rating_top == freezed
          ? _value.rating_top
          : rating_top // ignore: cast_nullable_to_non_nullable
              as int,
      ratings: ratings == freezed
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<Rating>,
      metacritic: metacritic == freezed
          ? _value.metacritic
          : metacritic // ignore: cast_nullable_to_non_nullable
              as int,
      reviews_count: reviews_count == freezed
          ? _value.reviews_count
          : reviews_count // ignore: cast_nullable_to_non_nullable
              as int,
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Game extends _Game {
  _$_Game(
      {@JsonKey(name: "id") this.id = 0,
      @JsonKey(name: "slug") this.slug = "",
      @JsonKey(name: "name") this.name = " ",
      @JsonKey(name: "released") this.released = " ",
      @JsonKey(name: "background_image") this.background_image = " ",
      @JsonKey(name: "rating") this.rating = 0.0,
      @JsonKey(name: "rating_top") this.rating_top = 5,
      @JsonKey(name: "ratings") this.ratings = const [],
      @JsonKey(name: "metacritic") this.metacritic = 0,
      @JsonKey(name: "reviews_count") this.reviews_count = 0,
      @JsonKey(name: "genres") this.genres = const []})
      : super._();

  factory _$_Game.fromJson(Map<String, dynamic> json) => _$$_GameFromJson(json);

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
  @JsonKey(name: "released")
  final String released;
  @override
  @JsonKey(name: "background_image")
  final String background_image;
  @override
  @JsonKey(name: "rating")
  final double rating;
  @override
  @JsonKey(name: "rating_top")
  final int rating_top;
  @override
  @JsonKey(name: "ratings")
  final List<Rating> ratings;
  @override
  @JsonKey(name: "metacritic")
  final int metacritic;
  @override
  @JsonKey(name: "reviews_count")
  final int reviews_count;
  @override
  @JsonKey(name: "genres")
  final List<Genre> genres;

  @override
  String toString() {
    return 'Game(id: $id, slug: $slug, name: $name, released: $released, background_image: $background_image, rating: $rating, rating_top: $rating_top, ratings: $ratings, metacritic: $metacritic, reviews_count: $reviews_count, genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Game &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.released, released) ||
                other.released == released) &&
            (identical(other.background_image, background_image) ||
                other.background_image == background_image) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.rating_top, rating_top) ||
                other.rating_top == rating_top) &&
            const DeepCollectionEquality().equals(other.ratings, ratings) &&
            (identical(other.metacritic, metacritic) ||
                other.metacritic == metacritic) &&
            (identical(other.reviews_count, reviews_count) ||
                other.reviews_count == reviews_count) &&
            const DeepCollectionEquality().equals(other.genres, genres));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      slug,
      name,
      released,
      background_image,
      rating,
      rating_top,
      const DeepCollectionEquality().hash(ratings),
      metacritic,
      reviews_count,
      const DeepCollectionEquality().hash(genres));

  @JsonKey(ignore: true)
  @override
  _$GameCopyWith<_Game> get copyWith =>
      __$GameCopyWithImpl<_Game>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameToJson(this);
  }
}

abstract class _Game extends Game {
  factory _Game(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "released") String released,
      @JsonKey(name: "background_image") String background_image,
      @JsonKey(name: "rating") double rating,
      @JsonKey(name: "rating_top") int rating_top,
      @JsonKey(name: "ratings") List<Rating> ratings,
      @JsonKey(name: "metacritic") int metacritic,
      @JsonKey(name: "reviews_count") int reviews_count,
      @JsonKey(name: "genres") List<Genre> genres}) = _$_Game;
  _Game._() : super._();

  factory _Game.fromJson(Map<String, dynamic> json) = _$_Game.fromJson;

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
  @JsonKey(name: "released")
  String get released;
  @override
  @JsonKey(name: "background_image")
  String get background_image;
  @override
  @JsonKey(name: "rating")
  double get rating;
  @override
  @JsonKey(name: "rating_top")
  int get rating_top;
  @override
  @JsonKey(name: "ratings")
  List<Rating> get ratings;
  @override
  @JsonKey(name: "metacritic")
  int get metacritic;
  @override
  @JsonKey(name: "reviews_count")
  int get reviews_count;
  @override
  @JsonKey(name: "genres")
  List<Genre> get genres;
  @override
  @JsonKey(ignore: true)
  _$GameCopyWith<_Game> get copyWith => throw _privateConstructorUsedError;
}
