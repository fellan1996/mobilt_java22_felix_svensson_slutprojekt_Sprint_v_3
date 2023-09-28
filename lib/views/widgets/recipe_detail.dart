import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// final databaseReference = FirebaseDatabase.instance.reference();


void saveRecipeTitle(String title) async {

  DatabaseReference ref = FirebaseDatabase.instance.ref("LatestTitle");

    await ref.set({
    "title": title,
  });
}

class RecipeDetailPage extends StatelessWidget {
  final String recipeTitle;

  const RecipeDetailPage({required this.recipeTitle, Key? key}) : super(key: key);

  void _saveTitleToFirebase() {
    // Call the function to save the recipe title to Firebase.
    saveRecipeTitle(recipeTitle);
    // You can also show a confirmation message here if needed.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Recipe details go here...'), // You can add more details here.
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTitleToFirebase,
              child: const Text('Save Recipe Title to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}
