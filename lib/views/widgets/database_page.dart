import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({Key? key}) : super(key: key);

  @override
  _DatabasePageState createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  String databaseData = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  void fetchDataFromDatabase() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('LatestTitle/title').get();
    if (snapshot.exists) {
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
