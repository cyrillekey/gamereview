// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'genre.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return _Genre.fromJson(json);
}

/// @nodoc
class _$GenreTearOff {
  const _$GenreTearOff();

  _Genre call(
      {@JsonKey(name: "id") int id = 0,
      @JsonKey(name: "name") String name = "",
      @JsonKey(name: "slug") String slug = "",
      @JsonKey(name: "games_count") int games_count = 0,
      @JsonKey(name: "image_background") String image_background = ""}) {
    return _Genre(
      id: id,
      name: name,
      slug: slug,
      games_count: games_count,
      image_background: image_background,
    );
  }

  Genre fromJson(Map<String, Object?> json) {
    return Genre.fromJson(json);
  }
}

/// @nodoc
const $Genre = _$GenreTearOff();

/// @nodoc
mixin _$Genre {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "games_count")
  int get games_count => throw _privateConstructorUsedError;
  @JsonKey(name: "image_background")
  String get image_background => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreCopyWith<Genre> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "games_count") int games_count,
      @JsonKey(name: "image_background") String image_background});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res> implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._value, this._then);

  final Genre _value;
  // ignore: unused_field
  final $Res Function(Genre) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? games_count = freezed,
    Object? image_background = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      games_count: games_count == freezed
          ? _value.games_count
          : games_count // ignore: cast_nullable_to_non_nullable
              as int,
      image_background: image_background == freezed
          ? _value.image_background
          : image_background // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$GenreCopyWith(_Genre value, $Res Function(_Genre) then) =
      __$GenreCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "games_count") int games_count,
      @JsonKey(name: "image_background") String image_background});
}

/// @nodoc
class __$GenreCopyWithImpl<$Res> extends _$GenreCopyWithImpl<$Res>
    implements _$GenreCopyWith<$Res> {
  __$GenreCopyWithImpl(_Genre _value, $Res Function(_Genre) _then)
      : super(_value, (v) => _then(v as _Genre));

  @override
  _Genre get _value => super._value as _Genre;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? games_count = freezed,
    Object? image_background = freezed,
  }) {
    return _then(_Genre(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      games_count: games_count == freezed
          ? _value.games_count
          : games_count // ignore: cast_nullable_to_non_nullable
              as int,
      image_background: image_background == freezed
          ? _value.image_background
          : image_background // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Genre implements _Genre {
  _$_Genre(
      {@JsonKey(name: "id") this.id = 0,
      @JsonKey(name: "name") this.name = "",
      @JsonKey(name: "slug") this.slug = "",
      @JsonKey(name: "games_count") this.games_count = 0,
      @JsonKey(name: "image_background") this.image_background = ""});

  factory _$_Genre.fromJson(Map<String, dynamic> json) =>
      _$$_GenreFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "slug")
  final String slug;
  @override
  @JsonKey(name: "games_count")
  final int games_count;
  @override
  @JsonKey(name: "image_background")
  final String image_background;

  @override
  String toString() {
    return 'Genre(id: $id, name: $name, slug: $slug, games_count: $games_count, image_background: $image_background)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Genre &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.games_count, games_count) ||
                other.games_count == games_count) &&
            (identical(other.image_background, image_background) ||
                other.image_background == image_background));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, games_count, image_background);

  @JsonKey(ignore: true)
  @override
  _$GenreCopyWith<_Genre> get copyWith =>
      __$GenreCopyWithImpl<_Genre>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenreToJson(this);
  }
}

abstract class _Genre implements Genre {
  factory _Genre(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "games_count") int games_count,
      @JsonKey(name: "image_background") String image_background}) = _$_Genre;

  factory _Genre.fromJson(Map<String, dynamic> json) = _$_Genre.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "slug")
  String get slug;
  @override
  @JsonKey(name: "games_count")
  int get games_count;
  @override
  @JsonKey(name: "image_background")
  String get image_background;
  @override
  @JsonKey(ignore: true)
  _$GenreCopyWith<_Genre> get copyWith => throw _privateConstructorUsedError;
}
