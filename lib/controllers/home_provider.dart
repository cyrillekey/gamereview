import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:gamereview/api_client/api_client.dart';
import 'package:gamereview/api_client/response.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/services/service_locator.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = true;
  List<Game> games = [];
  List<Game> popular = [];
  List<Game> carousel = [];
  loadItems() {
    getPopular();
    getGames();
  }

  final _apiClient = locator<ApiClient>();
  Future<List<Game>?> getGames() async {
    ApiRespose respose = await _apiClient.get(
        'https://api.rawg.io/api/games?key=674f1105f61c4d639627a88e417f7a91&ordering=released');
    final result = respose.response['results'];
    games = result.map<Game>((json) => Game.fromJson(json)).toList();
    isLoading = false;
    notifyListeners();
  }

  Future<List<Game>?> getPopular() async {
    ApiRespose respose = await _apiClient.get(
        'https://api.rawg.io/api/games?key=674f1105f61c4d639627a88e417f7a91&ordering=-rating');
    final result = respose.response['results'];
    popular = result.map<Game>((json) => Game.fromJson(json)).toList();
    carousel = popular.sublist(2, 6);
    isLoading = false;
    notifyListeners();
  }
}
