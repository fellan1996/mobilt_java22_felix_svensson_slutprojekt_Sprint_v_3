import 'package:flutter/material.dart';
import 'package:translation_app/models/recipe.api.dart';
import 'package:translation_app/models/recipe.dart';
import 'package:translation_app/views/widgets/recipe_card.dart';
import 'package:translation_app/views/widgets/recipe_detail.dart';
import 'package:translation_app/views/widgets/database_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          recipeTitle: _recipes[index].name,
                        ),
                      ),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DatabasePage(),
            ),
          );
        },
        child: const Text('Latest RecipeTitle'),
      ),
    );
  }
}
//       appBar: AppBar(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.restaurant_menu),
//             SizedBox(width: 10),
//             Text('Food Recipe'),
//           ],
//         ),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _recipes.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to the recipe detail page and pass the title.
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => RecipeDetailPage(
//                           recipeTitle: _recipes[index].name,
//                         ),
//                       ),
//                     );
//                   },
//                   child: RecipeCard(
//                     title: _recipes[index].name,
//                     cookTime: _recipes[index].totalTime,
//                     rating: _recipes[index].rating.toString(),
//                     thumbnailUrl: _recipes[index].images,
//                   ),
//                 );
              // },
            // ),
    // );
// }
