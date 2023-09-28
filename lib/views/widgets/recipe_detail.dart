import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// final databaseReference = FirebaseDatabase.instance.reference();

void _saveTitleToFirebase(recipeTitle) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    ref.child('LatestTitle').set({
      'title': recipeTitle,
    });

}

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
                'Recipe details go here...'), // You can add more details here.
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
    _saveTitleToFirebase(recipeTitle); // Pass the recipeTitle as a parameter
  },
              child: const Text('Save Recipe Title to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}
