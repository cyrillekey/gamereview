import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamereview/models/genre.dart';
import 'package:gamereview/models/platform.dart';
import 'package:gamereview/models/publisher.dart';
part 'game_details.g.dart';
part 'game_details.freezed.dart';

@freezed
class GameDetails with _$GameDetails {
  factory GameDetails(
      {@JsonKey(name: "id") @Default(0) int id,
      @JsonKey(name: "slug") @Default("") String slug,
      @JsonKey(name: "name") @Default("") String name,
      @JsonKey(name: "name_original") @Default("") String name_original,
      @JsonKey(name: "description_raw") @Default("") String description,
      @JsonKey(name: "metacritic") @Default(0) int metacritic,
      @JsonKey(name: "released") @Default("") String released,
      @JsonKey(name: "background_image") @Default("") String background_image,
      @JsonKey(name: "website") @Default("") String website,
      @JsonKey(name: "rating") @Default(0.0) double rating,
      @JsonKey(name: "metacritic_url") @Default(" ") String metacritic_url,
      @JsonKey(name: "publishers") @Default([]) List<Publisher> publisher,
      @JsonKey(name: "developers") @Default([]) List<Publisher> developers,
      @JsonKey(name: "platforms") @Default([]) List<PlatformWrapper> platforms,
      @JsonKey(name: 'genres') @Default([]) List<Genre> genres}) = _GameDetails;
  factory GameDetails.fromJson(Map<String, dynamic> json) =>
      _$GameDetailsFromJson(json);
}
