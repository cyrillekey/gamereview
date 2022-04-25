import 'package:drift/drift.dart';
import 'package:gamereview/models/game.dart';
export 'shared.dart';
part 'local_db.g.dart';

@DriftDatabase(tables: [GameTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);
  @override
  int get schemaVersion => 1;
}

@UseRowClass(Game)
class GameTable extends Table {
  IntColumn get id => integer()();
  TextColumn get slug => text()();
  TextColumn get name => text()();
  TextColumn get released => text()();
  TextColumn get background_image => text()();
  RealColumn get rating => real()();
  IntColumn get rating_top => integer()();
  IntColumn get metacritic => integer()();
  @override
  Set<Column> get primaryKey => {id};
}
