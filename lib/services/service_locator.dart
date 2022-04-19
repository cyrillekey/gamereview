import 'package:dio/dio.dart';
import 'package:gamereview/api_client/api_client.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;

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
}
