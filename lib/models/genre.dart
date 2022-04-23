import 'package:freezed_annotation/freezed_annotation.dart';
part 'genre.g.dart';
part 'genre.freezed.dart';

@freezed
class Genre with _$Genre {
  factory Genre(
      {@JsonKey(name: "id")
      @Default(0)
          int id,
      @JsonKey(name: "name")
      @Default("")
          String name,
      @JsonKey(name: "slug")
      @Default("")
          String slug,
      @JsonKey(name: "games_count")
      @Default(0)
          int games_count,
      @JsonKey(name: "image_background")
      @Default("")
          String image_background}) = _Genre;
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
