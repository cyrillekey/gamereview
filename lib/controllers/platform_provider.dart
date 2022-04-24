import 'package:flutter/cupertino.dart';
import 'package:gamereview/api_client/api_client.dart';
import 'package:gamereview/api_client/response.dart';
import 'package:gamereview/models/platform.dart';
import 'package:gamereview/services/service_locator.dart';

class PlatformProvider with ChangeNotifier {
  final apiClient = locator<ApiClient>();
  List<Platform> platforms = [];
  bool isLoading = true;
  int page = 1;
  loadItems() {
    getAllPlatforms();
  }

  Future<List<Platform>?> getAllPlatforms() async {
    ApiRespose respose = await apiClient.get(
        "https://api.rawg.io/api/platforms?key=674f1105f61c4d639627a88e417f7a91");
    platforms = respose.response['results']
        .map<Platform>((json) => Platform.fromJson(json))
        .toList();
    if (respose.response['next'] != null) {
      page++;
    } else {
      page = -1;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<List<Platform>?> loadMore() async {
    if (page > 1) {
      ApiRespose respose = await apiClient.get(
          "https://api.rawg.io/api/platforms?key=674f1105f61c4d639627a88e417f7a91&page=$page");
      List<Platform> temp = respose.response['results']
          .map<Platform>((json) => Platform.fromJson(json))
          .toList();
      platforms += temp;
      if (respose.response['next'] != null) {
        page++;
      } else {
        page = -1;
      }
    }
    notifyListeners();
  }
}
