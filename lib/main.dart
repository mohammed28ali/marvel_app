import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/src/app/app.dart';
import 'package:marvel_app/src/app/services_locator.dart';
import 'package:marvel_app/src/config/router/app_routes.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await Firebase.initializeApp();
  runApp(const MarvelApp());
}
