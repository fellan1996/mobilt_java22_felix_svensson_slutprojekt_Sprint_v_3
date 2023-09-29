// ignore_for_file: avoid_print
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:translation_app/firebase_options.dart';
import 'package:translation_app/views/home.dart';
import 'package:translation_app/views/widgets/database_page.dart';
import 'package:translation_app/views/widgets/recipe_detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Säkerställer att Flutter-motorn är initialiserad.

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Initialiserar Firebase med angivna alternativ från FirebaseOptions.
  );

  DatabaseReference ref = FirebaseDatabase.instance.ref("users1/1234"); // Skapar en referens till en specifik plats i Firebase-databasen.

  await ref.set({
    "name": "John",
    "age": 18,
    "address": {"line1": "100 Mountain View"}
  }); // Sätter data i Firebase-databasen under den angivna referensen.

  runApp(const MyApp()); // Kör huvudapplikationen MyApp.
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
      initialRoute: '/', // Ange den initiala rutten som visas när appen startar.
      routes: {
        '/': (context) => const HomePage(), // Definiera rutten '/' för HomePage-klassen.
        '/recipeDetail': (context) => const RecipeDetailPage(), // Definiera rutten '/recipeDetail' för RecipeDetailPage-klassen.
        '/databasePage': (context) => const DatabasePage(), // Definiera rutten '/databasePage' för DatabasePage-klassen.
      },
    );
  }
}
