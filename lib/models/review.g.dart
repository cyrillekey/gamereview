// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      id: json['id'] as String? ?? "",
      title: json['title'] as String? ?? "title",
      review: json['review'] as String? ?? "review",
      rating: json['rating'] as int? ?? 0,
      user: json['user'] == null
          ? null
          : UserReview.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'review': instance.review,
      'rating': instance.rating,
      'user': instance.user,
    };

_$_UserReview _$$_UserReviewFromJson(Map<String, dynamic> json) =>
    _$_UserReview(
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? " ",
      avatar: json['avatar'] as String? ?? " ",
    );

Map<String, dynamic> _$$_UserReviewToJson(_$_UserReview instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
    };
