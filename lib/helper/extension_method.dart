import 'package:flutter/material.dart';
import 'package:pokeapi/const/color.dart';

extension PokemonTypeExtension on String {
  Color toPokemonTypeColor() {
    switch (this) {
      case 'fire':
        return fire;
      case 'grass':
        return grass;
      case 'rock':
        return rock;
      case 'ghost':
        return ghost;
      case 'steel':
        return steel;
      case 'water':
        return water;
      case 'psychic':
        return psychic;
      case 'ice':
        return ice;
      case 'dark':
        return dark;
      case 'fairy':
        return fairy;
      case 'normal':
        return normal;
      case 'fighting':
        return fighting;
      case 'flying':
        return flying;
      case 'poison':
        return poison;
      case 'ground':
        return ground;
      case 'bug':
        return bug;
      case 'electric':
        return electric;
      case 'dragon':
        return dragon;
    }
    return grass;
  }
}