import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/info_screen.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard(this.pokemonInfo, this.pokedex);

  late final pokemonInfo;
  late final pokedex;

  late String id = pokemonInfo['num'];
  late String name = pokemonInfo['name'];
  late List types = pokemonInfo['type'];
  late String firstType = types[0];
  late String imgSrc = pokemonInfo['img'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(pokemonInfo, pokedex)));
      },
      child: Container(
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
                                  ? Colors.yellow
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
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              child: Image.asset(
                'images/pokeball.png',
                width: 100,
                fit: BoxFit.fitWidth,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      id,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  for (var type in types)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 12,
                            ),
                            child: Text(
                              type,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Hero(
                tag: 'pokemonImg'+name,
                child: CachedNetworkImage(
                  imageUrl: imgSrc,
                  height: 100,
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
