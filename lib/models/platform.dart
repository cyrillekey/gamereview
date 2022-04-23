import 'package:freezed_annotation/freezed_annotation.dart';
part 'platform.g.dart';
part 'platform.freezed.dart';

@freezed
class Platform with _$Platform {
  factory Platform(
      {@JsonKey(name: "id")
      @Default(0)
          int id,
      @JsonKey(name: "name")
      @Default("")
          String name,
      @JsonKey(name: "slug")
      @Default("")
          String image,
      @JsonKey(name: "games_count")
      @Default(0)
          int games_count,
      @JsonKey(name: "image_background")
      @Default("")
          String image_background}) = _Platform;
  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);
}

@freezed
class PlatformWrapper with _$PlatformWrapper {
  factory PlatformWrapper({
    Platform? platform,
    @JsonKey(name: "released_at") @Default("") String released_at,
  }) = _PlatformWrapper;
  factory PlatformWrapper.fromJson(Map<String, dynamic> json) =>
      _$PlatformWrapperFromJson(json);
}
