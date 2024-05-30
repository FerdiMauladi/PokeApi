import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pokeapi/data/model/dekripsi_pokemon_model.dart';
import 'package:pokeapi/data/model/detail_pokemon_model.dart';
import 'package:pokeapi/data/model/pokemon_model.dart';
import 'package:pokeapi/data/network_core.dart';
import 'package:pokeapi/data/repository/repository.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  FutureOr<PokemonModel?> getDataPokemon(
      int offset, int limit, String namaPokemon) async {
    try {
      var response =
          await network.dio.get("/pokemon/$namaPokemon", queryParameters: {
        "offset": offset,
        "limit": limit,
      });
      return PokemonModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  FutureOr<DeskripsiPokemonModel> getDeksripsiPokemon(String id) async {
    try {
      var response = await network.dio.get("/pokemon-species/$id");
      return DeskripsiPokemonModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.error);
      throw Exception(e);
    }
  }

  @override
  FutureOr<DetailPokemonModel> getDetailPokemon(String id) async {
    try {
      var response = await network.dio.get("/pokemon/$id");
      return DetailPokemonModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
