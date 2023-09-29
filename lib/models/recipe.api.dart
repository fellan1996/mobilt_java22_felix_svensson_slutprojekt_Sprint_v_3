import 'dart:convert';
import 'package:translation_app/models/recipe.dart';
import 'package:http/http.dart' as http;

// En klass som hanterar API-anrop för att hämta receptdata.
class RecipeApi {
  // En statisk metod som returnerar en framtida lista av recept.
  static Future<List<Recipe>> getRecipe() async {
    // Skapar en URI för API-anropet med angivna parametrar.
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    // Gör en HTTP GET-förfrågan till den angivna URI med nödvändiga headers.
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "insertAPI Key here",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    // Dekodar JSON-svar från API till en Map.
    Map data = jsonDecode(response.body);

    // Skapar en temporär lista för att lagra receptdetaljer.
    List tempArr = [];
    for (var i in data['feed']) {
      tempArr.add(i['content']['details']);
    }

    // Använder en metod för att konvertera listan av receptdetaljer till en lista av Recipe-objekt.
    return Recipe.recipesFromSnapshot(tempArr);
  }
}
