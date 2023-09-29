import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// final databaseReference = FirebaseDatabase.instance.reference();

// En funktion för att spara recepttiteln till Firebase-databasen.
void _saveTitleToFirebase(recipeTitle) {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  ref.child('LatestTitle').set({
    'title': recipeTitle,
  });
}

// En StatelessWidget som representerar sidan för att visa detaljer om ett recept.
class RecipeDetailPage extends StatelessWidget {
  // final String recipeTitle;
  // String recipeTitle;

  const RecipeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? recipeTitle =
        ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle ?? 'Default Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Recipe details go here...' // Här kan du lägga till mer detaljer om receptet.
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveTitleToFirebase(recipeTitle); // Anropa funktionen för att spara recepttiteln till Firebase-databasen och skicka med recepttiteln som parameter.
              },
              child: const Text('Save Recipe Title to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}
