import 'dart:async';

import 'package:pokeapi/data/model/dekripsi_pokemon_model.dart';
import 'package:pokeapi/data/model/detail_pokemon_model.dart';
import 'package:pokeapi/data/model/pokemon_model.dart';


abstract class Repository {

  FutureOr<PokemonModel?> getDataPokemon(int offset, int limit, String namaPokemon);
  FutureOr<DetailPokemonModel> getDetailPokemon(String id);
  FutureOr<DeskripsiPokemonModel> getDeksripsiPokemon(String id);
}