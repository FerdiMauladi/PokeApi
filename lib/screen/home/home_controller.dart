import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokeapi/data/model/detail_pokemon_model.dart';
import 'package:pokeapi/data/model/pokemon_model.dart' as pokemon;
import 'package:intl/intl.dart';
import 'package:pokeapi/data/model/pokemon_model.dart';
import 'package:pokeapi/data/repository/repository.dart';
import 'package:pokeapi/data/repository/repository_impl.dart';

class HomeController extends GetxController {
  final repository = Get.find<RepositoryImpl>();
  List<DetailPokemonModel> detailPokemon = <DetailPokemonModel>[];

  final limit = 9;

  var searchTerm = "";

  NumberFormat formatter = NumberFormat("#000");

  final PagingController<int, pokemon.Results?> pagingController =
      PagingController(firstPageKey: 0);

  final Debouncer debouncer =
      Debouncer(delay: const Duration(milliseconds: 400));

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> fetchPage(offset) async {
    try {
      final newItems =
          await repository.getDataPokemon(offset, limit, searchTerm);
      if (newItems != null && newItems.results != null) {
        PokemonModel pokemonData = newItems;
        for (pokemon.Results newItem in pokemonData.results!) {
          var dataDetail = await repository.getDetailPokemon(
              newItem.url?.split("pokemon").last.replaceAll("/", "") ?? "1");
          detailPokemon.add(dataDetail);
        }
      }

      final isLastPage = newItems!.results!.length < limit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.results!);
      } else {
        final nextPageKey = offset + newItems.results!.length;
        pagingController.appendPage(newItems.results!, nextPageKey);
        // if(searchTerm.isNotEmpty) {
        //   pagingController.itemList?.clear();
        //   pagingController.appendPage(newItems.results!.where((e) => e.name!.toLowerCase().contains(searchTerm.toLowerCase())).toList(), nextPageKey);
        // }
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void updateData(int index) {
    pagingController.itemList![index];
  }
}
