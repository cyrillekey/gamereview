import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamereview/models/genre.dart';
import 'package:gamereview/models/rating.dart';
part 'game.g.dart';
part 'game.freezed.dart';

@freezed
class Game with _$Game {
  factory Game(
      {@JsonKey(name: "id") @Default(0) int id,
      @JsonKey(name: "slug") @Default("") String slug,
      @JsonKey(name: "name") @Default(" ") String name,
      @JsonKey(name: "released") @Default(" ") String released,
      @JsonKey(name: "background_image") @Default(" ") String background_image,
      @JsonKey(name: "rating") @Default(0.0) double rating,
      @JsonKey(name: "rating_top") @Default(5) int rating_top,
      @JsonKey(name: "ratings") @Default([]) List<Rating> ratings,
      @JsonKey(name: "metacritic") @Default(0) int metacritic,
      @JsonKey(name: "reviews_count") @Default(0) int reviews_count,
      @JsonKey(name: "genres") @Default([]) List<Genre> genres}) = _Game;
  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
