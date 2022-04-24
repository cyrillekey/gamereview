import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gamereview/controllers/auth_provider.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/controllers/platform_provider.dart';
import 'package:gamereview/my_app.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => Authprovider()),
      ChangeNotifierProvider(create: (_) => PlatformProvider())
    ],
    child: MyApp(),
  ));
  FlutterNativeSplash.remove();
}
