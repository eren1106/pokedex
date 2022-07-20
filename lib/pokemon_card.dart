import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard(this.pokemonInfo);

  late final pokemonInfo;

  late String id = pokemonInfo['num'];
  late String name = pokemonInfo['name'];
  late List types = pokemonInfo['type'];
  late String firstType = types[0];
  late String imgSrc = pokemonInfo['img'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: firstType == "Grass"
            ? Colors.greenAccent[400]
            : firstType == "Fire"
                ? Colors.redAccent
                : firstType == "Fire"
                    ? Colors.redAccent
                    : firstType == "Water"
                        ? Colors.blueAccent
                        : firstType == "Normal"
                            ? Colors.grey
                            : firstType == "Electric"
                                ? Colors.yellowAccent
                                : firstType == "Ice"
                                    ? Colors.lightBlueAccent
                                    : firstType == "Fighting"
                                        ? Colors.red[700]
                                        : firstType == "Fire"
                                            ? Colors.redAccent
                                            : firstType == "Poison"
                                                ? Colors.purple
                                                : firstType == "Ground"
                                                    ? Colors.orange[400]
                                                    : firstType == "Flying"
                                                        ? Colors.blueAccent[100]
                                                        : firstType == "Psychic"
                                                            ? Colors.pinkAccent
                                                            : firstType == "Bug"
                                                                ? Colors.lightGreen[
                                                                    600]
                                                                : firstType ==
                                                                        "Rock"
                                                                    ? Colors
                                                                        .brown
                                                                    : firstType ==
                                                                            "Ghost"
                                                                        ? Colors.purple[
                                                                            900]
                                                                        : firstType ==
                                                                                "Dark"
                                                                            ? Colors.blueGrey[900]
                                                                            : firstType == "Fire"
                                                                                ? Colors.redAccent
                                                                                : firstType == "Dragon"
                                                                                    ? Colors.indigo
                                                                                    : firstType == "Steel"
                                                                                        ? Colors.blueGrey[300]
                                                                                        : Colors.pink[100],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    id,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black26,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                for (var type in types)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(type),
                  )
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: CachedNetworkImage(
                imageUrl: imgSrc,
                height: 100,
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
