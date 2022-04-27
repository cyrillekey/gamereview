import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:gamereview/api_client/api_client.dart';
import 'package:gamereview/api_client/response.dart';
import 'package:gamereview/database/local_db_dao.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/models/game_details.dart';
import 'package:gamereview/services/service_locator.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = true;
  List<Game> games = [];
  List<Game> popular = [];
  List<Game> carousel = [];

  LocalDatabaseDao db = locator<LocalDatabaseDao>();
  int page = 1;
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

    carousel = popular.sublist(4, 12);

    // isLoading = false;
    //notifyListeners();
  }

  Future<GameDetails> getSingleGame(int id) async {
    ApiRespose response = await _apiClient.get(
        "https://api.rawg.io/api/games/$id?key=674f1105f61c4d639627a88e417f7a91");
    logger.e(response.response);
    GameDetails details = GameDetails.fromJson(response.response);
    logger.d(details);
    return details;
  }

  Future<void> loadMorePopular() async {
    // isLoading = true;
    // notifyListeners();
    page++;

    ApiRespose respose = await _apiClient.get(
        'https://api.rawg.io/api/games?key=674f1105f61c4d639627a88e417f7a91&ordering=-rating&page=$page');
    final result = respose.response['results'];
    List<Game> games = result.map<Game>((json) => Game.fromJson(json)).toList();
    popular += [...games];
    //  isLoading = false;
    //  notifyListeners();

    // // isLoading = false;
    notifyListeners();
    //return games;
    logger.e(popular.length);
  }

  saveFavourite(Game game) async {
    await db.saveGame(game);
    notifyListeners();
  }
}
