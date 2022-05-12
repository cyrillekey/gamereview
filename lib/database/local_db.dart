import 'package:drift/drift.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/models/news_article_model.dart';
export 'shared.dart';
part 'local_db.g.dart';

@DriftDatabase(tables: [GameTable, SourceTable, NewsTable])
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

@UseRowClass(Source)
class SourceTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get language => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@UseRowClass(NewsArticleModel)
class NewsTable extends Table {
  TextColumn get author => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get urlToImage => text()();
  TextColumn get publishedAt => text()();
}
