import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// En Widget som representerar en sida som hämtar data från Firebase-databasen.
class DatabasePage extends StatefulWidget {
  const DatabasePage({Key? key}) : super(key: key);

  @override
  _DatabasePageState createState() => _DatabasePageState();
}

// Den privata (underscore) State-klassen för DatabasePage.
class _DatabasePageState extends State<DatabasePage> {
  String databaseData = "Loading..."; // En sträng för att lagra hämtad data från databasen.

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase(); // Vid initiering, hämta data från databasen.
  }

  // En funktion som hämtar data från Firebase-databasen.
  void fetchDataFromDatabase() async {
    final ref = FirebaseDatabase.instance.ref(); // Skapar en referens till Firebase-databasen.
    final snapshot = await ref.child('LatestTitle/title').get(); // Hämtar data från en specifik sökväg i databasen.
    if (snapshot.exists) {
      // Om data finns i databasen, uppdatera widgeten med den hämtade datan.
      setState(() {
        databaseData = snapshot.value.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Latest RecipeTitle:',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Text(
              databaseData,
              style: const TextStyle(fontSize: 22, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
