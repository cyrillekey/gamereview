import 'package:drift/web.dart';
import 'package:gamereview/database/local_db.dart';

AppDatabase constructDb() {
  return AppDatabase(WebDatabase('db'));
}
