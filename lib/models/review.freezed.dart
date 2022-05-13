// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
class _$ReviewTearOff {
  const _$ReviewTearOff();

  _Review call(
      {@JsonKey(name: "id") String id = "",
      @JsonKey(name: "title") String title = "title",
      @JsonKey(name: "review") String review = "review",
      @JsonKey(name: "rating") int rating = 0,
      UserReview? user}) {
    return _Review(
      id: id,
      title: title,
      review: review,
      rating: rating,
      user: user,
    );
  }

  Review fromJson(Map<String, Object?> json) {
    return Review.fromJson(json);
  }
}

/// @nodoc
const $Review = _$ReviewTearOff();

/// @nodoc
mixin _$Review {
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "review")
  String get review => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  int get rating => throw _privateConstructorUsedError;
  UserReview? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "review") String review,
      @JsonKey(name: "rating") int rating,
      UserReview? user});

  $UserReviewCopyWith<$Res>? get user;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res> implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  final Review _value;
  // ignore: unused_field
  final $Res Function(Review) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? review = freezed,
    Object? rating = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserReview?,
    ));
  }

  @override
  $UserReviewCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserReviewCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) then) =
      __$ReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "review") String review,
      @JsonKey(name: "rating") int rating,
      UserReview? user});

  @override
  $UserReviewCopyWith<$Res>? get user;
}

/// @nodoc
class __$ReviewCopyWithImpl<$Res> extends _$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(_Review _value, $Res Function(_Review) _then)
      : super(_value, (v) => _then(v as _Review));

  @override
  _Review get _value => super._value as _Review;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? review = freezed,
    Object? rating = freezed,
    Object? user = freezed,
  }) {
    return _then(_Review(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserReview?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Review implements _Review {
  _$_Review(
      {@JsonKey(name: "id") this.id = "",
      @JsonKey(name: "title") this.title = "title",
      @JsonKey(name: "review") this.review = "review",
      @JsonKey(name: "rating") this.rating = 0,
      this.user});

  factory _$_Review.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewFromJson(json);

  @override
  @JsonKey(name: "id")
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "review")
  final String review;
  @override
  @JsonKey(name: "rating")
  final int rating;
  @override
  final UserReview? user;

  @override
  String toString() {
    return 'Review(id: $id, title: $title, review: $review, rating: $rating, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Review &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, review, rating, user);

  @JsonKey(ignore: true)
  @override
  _$ReviewCopyWith<_Review> get copyWith =>
      __$ReviewCopyWithImpl<_Review>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewToJson(this);
  }
}

abstract class _Review implements Review {
  factory _Review(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "review") String review,
      @JsonKey(name: "rating") int rating,
      UserReview? user}) = _$_Review;

  factory _Review.fromJson(Map<String, dynamic> json) = _$_Review.fromJson;

  @override
  @JsonKey(name: "id")
  String get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "review")
  String get review;
  @override
  @JsonKey(name: "rating")
  int get rating;
  @override
  UserReview? get user;
  @override
  @JsonKey(ignore: true)
  _$ReviewCopyWith<_Review> get copyWith => throw _privateConstructorUsedError;
}

UserReview _$UserReviewFromJson(Map<String, dynamic> json) {
  return _UserReview.fromJson(json);
}

/// @nodoc
class _$UserReviewTearOff {
  const _$UserReviewTearOff();

  _UserReview call(
      {@JsonKey(name: "name") String name = "",
      @JsonKey(name: "email") String email = " ",
      @JsonKey(name: "avatar") String avatar = " "}) {
    return _UserReview(
      name: name,
      email: email,
      avatar: avatar,
    );
  }

  UserReview fromJson(Map<String, Object?> json) {
    return UserReview.fromJson(json);
  }
}

/// @nodoc
const $UserReview = _$UserReviewTearOff();

/// @nodoc
mixin _$UserReview {
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "avatar")
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserReviewCopyWith<UserReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReviewCopyWith<$Res> {
  factory $UserReviewCopyWith(
          UserReview value, $Res Function(UserReview) then) =
      _$UserReviewCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "avatar") String avatar});
}

/// @nodoc
class _$UserReviewCopyWithImpl<$Res> implements $UserReviewCopyWith<$Res> {
  _$UserReviewCopyWithImpl(this._value, this._then);

  final UserReview _value;
  // ignore: unused_field
  final $Res Function(UserReview) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserReviewCopyWith<$Res> implements $UserReviewCopyWith<$Res> {
  factory _$UserReviewCopyWith(
          _UserReview value, $Res Function(_UserReview) then) =
      __$UserReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "avatar") String avatar});
}

/// @nodoc
class __$UserReviewCopyWithImpl<$Res> extends _$UserReviewCopyWithImpl<$Res>
    implements _$UserReviewCopyWith<$Res> {
  __$UserReviewCopyWithImpl(
      _UserReview _value, $Res Function(_UserReview) _then)
      : super(_value, (v) => _then(v as _UserReview));

  @override
  _UserReview get _value => super._value as _UserReview;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_UserReview(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserReview implements _UserReview {
  _$_UserReview(
      {@JsonKey(name: "name") this.name = "",
      @JsonKey(name: "email") this.email = " ",
      @JsonKey(name: "avatar") this.avatar = " "});

  factory _$_UserReview.fromJson(Map<String, dynamic> json) =>
      _$$_UserReviewFromJson(json);

  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "avatar")
  final String avatar;

  @override
  String toString() {
    return 'UserReview(name: $name, email: $email, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserReview &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, avatar);

  @JsonKey(ignore: true)
  @override
  _$UserReviewCopyWith<_UserReview> get copyWith =>
      __$UserReviewCopyWithImpl<_UserReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserReviewToJson(this);
  }
}

abstract class _UserReview implements UserReview {
  factory _UserReview(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "avatar") String avatar}) = _$_UserReview;

  factory _UserReview.fromJson(Map<String, dynamic> json) =
      _$_UserReview.fromJson;

  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "avatar")
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$UserReviewCopyWith<_UserReview> get copyWith =>
      throw _privateConstructorUsedError;
}
