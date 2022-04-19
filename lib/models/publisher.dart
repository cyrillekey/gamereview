import 'package:freezed_annotation/freezed_annotation.dart';
part 'publisher.g.dart';
part 'publisher.freezed.dart';

@freezed
class Publisher with _$Publisher {
  factory Publisher(
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
          String image_background}) = _Publisher;
  factory Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);
}
