// ignore_for_file: avoid_print
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:translation_app/views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyB9wo-PfqydI0p02iNavgGskZyc8BtcZHs",
      authDomain: "translation-flutter-mobil.firebaseapp.com",
      projectId: "translation-flutter-mobil",
      storageBucket: "translation-flutter-mobil.appspot.com",
      messagingSenderId: "904810739759",
      appId: "1:904810739759:web:0befc9bc245eebb897eeda",
      //measurementId: 'G-D5JK51JKFX',
      databaseURL:
          "https://translation-flutter-mobil-default-rtdb.europe-west1.firebasedatabase.app",
    ));
  } else {
    //android
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBnkMBQ-V6mMQfmMhXplU6BtUPYvNYqqNY",
            authDomain: "translation-flutter-mobil.firebaseapp.com",
            projectId: "translation-flutter-mobil",
            storageBucket: "translation-flutter-mobil.appspot.com",
            messagingSenderId: "904810739759",
            databaseURL:
                "https://translation-flutter-mobil-default-rtdb.europe-west1.firebasedatabase.app",
            appId: "1:904810739759:android:0ae88fcaa10aa62d97eeda"));
  }
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

  await ref.set({
    "name": "John",
    "age": 18,
    "address": {"line1": "100 Mountain View"}
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}
