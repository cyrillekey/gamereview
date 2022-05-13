import 'package:freezed_annotation/freezed_annotation.dart';
part 'review.g.dart';
part 'review.freezed.dart';

@freezed
class Review with _$Review {
  factory Review(
      {@JsonKey(name: "id") @Default("") String id,
      @JsonKey(name: "title") @Default("title") String title,
      @JsonKey(name: "review") @Default("review") String review,
      @JsonKey(name: "rating") @Default(0) int rating,
      UserReview? user}) = _Review;
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class UserReview with _$UserReview {
  factory UserReview(
      {@JsonKey(name: "name") @Default("") String name,
      @JsonKey(name: "email") @Default(" ") String email,
      @JsonKey(name: "avatar") @Default(" ") String avatar}) = _UserReview;
  factory UserReview.fromJson(Map<String, dynamic> json) =>
      _$UserReviewFromJson(json);
}
