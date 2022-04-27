import 'package:flutter/cupertino.dart';
import 'package:gamereview/database/local_db_dao.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/models/game_details.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:collection/collection.dart';

class FavouriteProvider with ChangeNotifier {
  List<Game> favourites = [];
  LocalDatabaseDao db = locator<LocalDatabaseDao>();
  getFavourites() async {
    favourites = await db.getAllFavourites();
    notifyListeners();
  }

  deleteFavoutire(int id) async {
    await db.deleteMediaFavoutire(id);
    getFavourites();
  }

  bool isFavourite(GameDetails game) {
    Game? itm = favourites.firstWhereOrNull(
      (element) => element.id == game.id,
    );
    return itm != null;
  }
}
