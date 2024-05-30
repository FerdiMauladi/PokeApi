import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pokeapi/data/model/detail_pokemon_model.dart';
import 'package:pokeapi/data/repository/repository_impl.dart';

enum DetailViewState {
  none,
  loading,
  error,
}

class DetailController extends GetxController with GetSingleTickerProviderStateMixin {
  NumberFormat formatter = NumberFormat("#000");
  DetailViewState _state = DetailViewState.none;
  DetailViewState get state => _state;
  final repository = Get.find<RepositoryImpl>();
  List<String?> flavourText = [];
  List<String?> flavourTextEn = [];
  Set<String?> listFilter = {};
  DetailPokemonModel? detailPokemon;
  var dataArgument = Get.arguments;
  late TabController tabController;

  changeState(DetailViewState s) {
    _state = s;
    update();
  }
  
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    getDekripsiPokemon();
    super.onInit();
  }


  Future getDekripsiPokemon () async {
    changeState(DetailViewState.loading);
    String id = dataArgument['id'].toString();

    try {
      var dataDetail = await repository.getDetailPokemon(id);
      detailPokemon = dataDetail;
      var dataDeksripsi = await repository.getDeksripsiPokemon(id);
      for (int index = 0; index <= dataDeksripsi.flavorTextEntries!.length; index++) {
        if (dataDeksripsi.flavorTextEntries?[index].language!.name == 'en') {
          flavourText = dataDeksripsi.flavorTextEntries!.map((e) => e.flavorText).toList();
        }
        listFilter = flavourText.toSet();
        flavourText = listFilter.toList();
        update();
        changeState(DetailViewState.none);
      }
    }
    catch (e){
      changeState(DetailViewState.error);
      return e;
    }
  }

}
