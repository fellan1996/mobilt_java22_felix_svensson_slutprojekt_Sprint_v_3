import 'dart:convert';
import 'package:translation_app/models/recipe.dart';
import 'package:http/http.dart' as http;
class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "insertAPIKey",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List tempArr = [];
    for (var i in data['feed']) {
      tempArr.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(tempArr);
  }
}