// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      measurementId: 'G-D5JK51JKFX',
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
            appId: "1:904810739759:android:0ae88fcaa10aa62d97eeda"));

    //firestore
    final FirebaseFirestore storedb = FirebaseFirestore.instance;
    final city = <String, String>{
      "name": "ALRIKdfgdffdgd",
      "age": "31",
      "country": "Sweden"
    };
    
    storedb
        .collection("cities2")
        .doc("LA")
        .set(city)
        // ignore: sdk_version_since
        .onError((e, _) => print("Error writing document: $e"));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white, // Setting white as the primary color for body text
      ),
      home: const Scaffold(
        // Empty Scaffold
      ),
    );
  }
}

