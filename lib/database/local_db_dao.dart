import 'package:drift/drift.dart';
import 'package:gamereview/database/local_db.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/services/service_locator.dart';
part 'local_db_dao.g.dart';

@DriftAccessor(tables: [GameTable])
class LocalDatabaseDao extends DatabaseAccessor<AppDatabase>
    with _$LocalDatabaseDaoMixin {
  LocalDatabaseDao(AppDatabase db) : super(db);
  Future<void> saveGame(Game game) async {
    gameTable.insert().insert(game).then((value) {
      logger.i(value);
    }).catchError((error) {
      logger.e(error);
    });
  }

  Future<List<Game>> getAllFavourites() async {
    return select(gameTable).get();
  }
}