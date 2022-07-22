import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen(this.pokemonInfo, this.pokedex);

  late final pokemonInfo;
  late final pokedex;

  late String id = pokemonInfo['num'];
  late String name = pokemonInfo['name'];
  late List types = pokemonInfo['type'];
  late String firstType = types[0];
  late String imgSrc = pokemonInfo['img'];
  late String height = pokemonInfo['height'];
  late String weight = pokemonInfo['weight'];
  late String eggDistance = pokemonInfo['egg'];
  late String weaknesses = pokemonInfo['weaknesses'].join(', ');
  List prevEvolutionUrl = [];
  List nextEvolutionUrl = [];
  List prevEvolutionName = [];
  List nextEvolutionName = [];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    if (pokemonInfo['prev_evolution'] != null) {
      for (var i in pokemonInfo['prev_evolution']) {
        for (var j in pokedex) {
          if (j['num'] == i['num']) {
            prevEvolutionUrl.add(j['img']);
            prevEvolutionName.add(j['name']);
            break;
          }
        }
      }
    }
    if (pokemonInfo['next_evolution'] != null) {
      for (var i in pokemonInfo['next_evolution']) {
        for (var j in pokedex) {
          if (j['num'] == i['num']) {
            nextEvolutionUrl.add(j['img']);
            nextEvolutionName.add(j['name']);
            break;
          }
        }
      }
    }

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
              padding: const EdgeInsets.only(top: 20, bottom: 10, left: 25, right: 25),
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InfoText('Height', false),
                                  InfoText('Weight', false),
                                  InfoText('Egg Distance', false),
                                  InfoText('Weaknesses', false),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InfoText(height, true),
                                  InfoText(weight, true),
                                  InfoText(eggDistance, true),
                                  InfoText(weaknesses, true),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          pokemonInfo['prev_evolution'] == null
                              ? Container()
                              : EvolutionCard(
                                  false, prevEvolutionName, prevEvolutionUrl),
                          pokemonInfo['next_evolution'] == null
                              ? Container()
                              : EvolutionCard(
                                  true, nextEvolutionName, nextEvolutionUrl),
                        ],
                      ),
                    ],
                  ),
                ),
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

class EvolutionCard extends StatelessWidget {
  EvolutionCard(this.isNext, this.evolutionName, this.evolutionUrl);

  final bool isNext;
  final List evolutionName;
  final List evolutionUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              padding: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black54, width: 2),
                ),
              ),
              child: Text(
                isNext ? "Next Evolution" : "Prev Evolution",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Row(
            children: [
              for (var i = 0; i < evolutionName.length; i++)
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: CachedNetworkImage(
                          imageUrl: evolutionUrl[i],
                          height: 80,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Text(
                        evolutionName[i],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  InfoText(this.text, this.isBold);

  final String text;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: isBold ? Colors.black : Colors.black54,
          ),
        ),
      ),
    );
  }
}
