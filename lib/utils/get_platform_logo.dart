import 'package:gamereview/utils/images.dart';

String getPlatformImage(String name) {
  String image = "";
  switch (name) {
    case "playstation5":
      image = Images.ps5_logo;
      break;
    case "playstation4":
      image = Images.ps4_logo;
      break;
    case "playstation3":
      image = Images.ps3_logo;
      break;
    case "playstation2":
      image = Images.ps2_logo;
      break;
    case "macos":
      image = Images.mac_logo;
      break;
    case "ios":
      image = Images.ios_logo;
      break;
    case "nintendo-switch":
      image = Images.switch_logo;
      break;
    case "pc":
      image = Images.windows_logo;
      break;
    case "xbox-one":
      image = Images.xbox_one;
      break;
    case "xbox-series-x":
      image = Images.xbox_series;
      break;
    default:
      image = Images.gaming;
  }
  return image;
}
