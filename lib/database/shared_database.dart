import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:gamereview/database/local_db.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

AppDatabase constructDb() {
  return AppDatabase(LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'game.sqlite'));
    return NativeDatabase(file);
  }));
}
