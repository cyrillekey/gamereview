import 'package:freezed_annotation/freezed_annotation.dart';
part 'rating.g.dart';
part 'rating.freezed.dart';

@freezed
class Rating with _$Rating {
  factory Rating(
      {@JsonKey(name: "id") @Default(0) int id,
      @JsonKey(name: "title") @Default("") String title,
      @JsonKey(name: "count") @Default(0) int count,
      @JsonKey(name: "percent") @Default(0.0) double percent}) = _Rating;
  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
