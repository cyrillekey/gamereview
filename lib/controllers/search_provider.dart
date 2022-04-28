import 'package:flutter/cupertino.dart';
import 'package:gamereview/api_client/api_client.dart';
import 'package:gamereview/api_client/response.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/services/service_locator.dart';

class SearchProvider with ChangeNotifier {
  final _apiClient = locator<ApiClient>();
  List<Game> games = [];
  bool searching = false;
  Future<void> search(String query) async {
    searching = true;
    notifyListeners();
    ApiRespose response = await _apiClient.get(
        "https://api.rawg.io/api/games?key=674f1105f61c4d639627a88e417f7a91&search=$query");
    if (response.isSuccess) {
      games = response.response['results']
          .map<Game>((e) => Game.fromJson(e))
          .toList();
    }
    searching = false;
    notifyListeners();
  }

  clear() {
    games = [];
  }
}
