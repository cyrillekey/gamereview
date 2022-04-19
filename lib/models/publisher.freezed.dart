// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'publisher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Publisher _$PublisherFromJson(Map<String, dynamic> json) {
  return _Publisher.fromJson(json);
}

/// @nodoc
mixin _$Publisher {
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
  $PublisherCopyWith<Publisher> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublisherCopyWith<$Res> {
  factory $PublisherCopyWith(Publisher value, $Res Function(Publisher) then) =
      _$PublisherCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "games_count") int games_count,
      @JsonKey(name: "image_background") String image_background});
}

/// @nodoc
class _$PublisherCopyWithImpl<$Res> implements $PublisherCopyWith<$Res> {
  _$PublisherCopyWithImpl(this._value, this._then);

  final Publisher _value;
  // ignore: unused_field
  final $Res Function(Publisher) _then;

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
abstract class _$PublisherCopyWith<$Res> implements $PublisherCopyWith<$Res> {
  factory _$PublisherCopyWith(
          _Publisher value, $Res Function(_Publisher) then) =
      __$PublisherCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "games_count") int games_count,
      @JsonKey(name: "image_background") String image_background});
}

/// @nodoc
class __$PublisherCopyWithImpl<$Res> extends _$PublisherCopyWithImpl<$Res>
    implements _$PublisherCopyWith<$Res> {
  __$PublisherCopyWithImpl(_Publisher _value, $Res Function(_Publisher) _then)
      : super(_value, (v) => _then(v as _Publisher));

  @override
  _Publisher get _value => super._value as _Publisher;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? games_count = freezed,
    Object? image_background = freezed,
  }) {
    return _then(_Publisher(
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
class _$_Publisher implements _Publisher {
  _$_Publisher(
      {@JsonKey(name: "id") this.id = 0,
      @JsonKey(name: "name") this.name = "",
      @JsonKey(name: "slug") this.slug = "",
      @JsonKey(name: "games_count") this.games_count = 0,
      @JsonKey(name: "image_background") this.image_background = ""});

  factory _$_Publisher.fromJson(Map<String, dynamic> json) =>
      _$$_PublisherFromJson(json);

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
    return 'Publisher(id: $id, name: $name, slug: $slug, games_count: $games_count, image_background: $image_background)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Publisher &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality()
                .equals(other.games_count, games_count) &&
            const DeepCollectionEquality()
                .equals(other.image_background, image_background));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(slug),
      const DeepCollectionEquality().hash(games_count),
      const DeepCollectionEquality().hash(image_background));

  @JsonKey(ignore: true)
  @override
  _$PublisherCopyWith<_Publisher> get copyWith =>
      __$PublisherCopyWithImpl<_Publisher>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublisherToJson(this);
  }
}

abstract class _Publisher implements Publisher {
  factory _Publisher(
          {@JsonKey(name: "id") final int id,
          @JsonKey(name: "name") final String name,
          @JsonKey(name: "slug") final String slug,
          @JsonKey(name: "games_count") final int games_count,
          @JsonKey(name: "image_background") final String image_background}) =
      _$_Publisher;

  factory _Publisher.fromJson(Map<String, dynamic> json) =
      _$_Publisher.fromJson;

  @override
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "slug")
  String get slug => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "games_count")
  int get games_count => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "image_background")
  String get image_background => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PublisherCopyWith<_Publisher> get copyWith =>
      throw _privateConstructorUsedError;
}
