import 'package:flutter/material.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/my_app.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
    child: MyApp(),
  ));
}
