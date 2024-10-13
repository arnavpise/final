import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nichrome_test/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nichrome_test/data/repositories/authentication/authentication_repository.dart';
import 'package:nichrome_test/firebase_options.dart';
import 'package:nichrome_test/localization/profile_provider.dart';

/// -- Entry point of Flutter App
Future<void> main() async {
  /// Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// --Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase and Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Register ProfileProvider with GetX
  Get.put(ProfileProvider());

  // Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}

