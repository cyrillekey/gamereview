import 'package:dio/dio.dart';
import 'package:gamereview/api_client/api_client.dart';
import 'package:gamereview/database/local_db.dart';
import 'package:gamereview/database/local_db_dao.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;
final AppDatabase appDatabase = AppDatabase(constructDb().executor);
var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 1,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true));
void setupLocator() {
  locator.registerSingleton(ApiClient('', Dio()));
  locator.registerSingleton(LocalDatabaseDao(appDatabase));
}
