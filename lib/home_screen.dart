import 'dart:convert';

import 'package:flutter/material.dart';
import 'pokemon_card.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List pokedex;
  @override
  void initState() {
    super.initState();
    pokedex = [];
    fetchData();
  }

  void fetchData() async {
    var url = Uri.https("raw.githubusercontent.com",
        "Biuni/PokemonGO-Pokedex/master/pokedex.json");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      pokedex = await jsonDecode(res.body)['pokemon'];
      setState(() {
        
      });
    } else {
      print(res.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        backgroundColor: Color.fromARGB(255, 240, 0, 0),
      ),
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1.4,
        ),
        padding: EdgeInsets.all(10),
        itemCount: pokedex.length,
        itemBuilder: (BuildContext context, int index) {
          return PokemonCard(pokedex[index]);
        },
      ),
    );
  }
}
