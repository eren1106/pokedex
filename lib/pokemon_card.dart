import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard(this.name);
  late String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(name),
      ),
    );
  }
}