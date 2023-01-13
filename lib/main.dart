import 'package:berna_libary/app/app_module.dart';
import 'package:berna_libary/app/app_widget.dart';
import 'package:berna_libary/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final auth = FirebaseAuth.instanceFor(app: firebaseApp);

    return runApp(
      ModularApp(
        module: AppModule(auth: auth, firebaseApp: firebaseApp),
        child: const App(),
      ),
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}
