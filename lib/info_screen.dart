import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen(this.pokemonInfo);

  late final pokemonInfo;

  late String id = pokemonInfo['num'];
  late String name = pokemonInfo['name'];
  late List types = pokemonInfo['type'];
  late String firstType = types[0];
  late String imgSrc = pokemonInfo['img'];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
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
                                                          ? Colors
                                                              .blueAccent[100]
                                                          : firstType ==
                                                                  "Psychic"
                                                              ? Colors
                                                                  .pinkAccent
                                                              : firstType ==
                                                                      "Bug"
                                                                  ? Colors.lightGreen[
                                                                      600]
                                                                  : firstType ==
                                                                          "Rock"
                                                                      ? Colors
                                                                          .brown
                                                                      : firstType ==
                                                                              "Ghost"
                                                                          ? Colors
                                                                              .purple[900]
                                                                          : firstType == "Dark"
                                                                              ? Colors.blueGrey[900]
                                                                              : firstType == "Fire"
                                                                                  ? Colors.redAccent
                                                                                  : firstType == "Dragon"
                                                                                      ? Colors.indigo
                                                                                      : firstType == "Steel"
                                                                                          ? Colors.blueGrey[300]
                                                                                          : Colors.pink[100],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '#' + id,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          name,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: Row(
                            children: [
                              for (var type in types)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        type,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.17,
              child: Image.asset(
                'images/pokeball.png',
                height: 300,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            Positioned(
              top: screenHeight * 0.45,
              child: Container(
                height: screenHeight * 0.55,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Text("testing"),
              ),
            ),
            Positioned(
              top: screenHeight * 0.22,
              child: Hero(
                tag: 'pokemonImg' + name,
                child: CachedNetworkImage(
                  height: 200,
                  imageUrl: imgSrc,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
