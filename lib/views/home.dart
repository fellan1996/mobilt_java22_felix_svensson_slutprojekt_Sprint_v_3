import 'package:flutter/material.dart';
import 'package:translation_app/models/recipe.api.dart';
import 'package:translation_app/models/recipe.dart';
import 'package:translation_app/views/widgets/recipe_card.dart';

// En Widget som representerar startsidan i appen.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

// Den privata (underscore) State-klassen för HomePage.
class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes; // En lista för att lagra receptdata.
  bool _isLoading = true; // En flagga som indikerar om data laddas.

  @override
  void initState() {
    super.initState();
    getRecipes(); // Vid initiering, hämta receptdata.
  }

  // En asynkron funktion för att hämta receptdata.
  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe(); // Hämta recept från API.
    setState(() {
      _isLoading = false; // Uppdatera _isLoading när data är hämtad.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Recipe'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/recipeDetail',
                      arguments: _recipes[index].name,
                    );
                  },
                  child: RecipeCard(
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].images,
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.pushNamed(context, '/databasePage');
        },
        child: const Text('Latest RecipeTitle'),
      ),
    );
  }
}
