import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokeapi/data/model/pokemon_model.dart' as pokemon;
import 'package:pokeapi/screen/detail/detail_screen.dart';
import 'package:pokeapi/helper/extension_method.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.red,
                floating: true,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/icon/ic_pokeball.svg',
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
                ),
                title: const Text(
                  'Pokedex',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PagedSliverGrid<int, pokemon.Results?>(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 4
                      : 2,
                  crossAxisSpacing: 4,
                  mainAxisExtent: 150,
                ),
                showNewPageProgressIndicatorAsGridChild: false,
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<pokemon.Results?>(
                    itemBuilder: (context, item, index) {
                  return Card(
                    color: controller.detailPokemon[index].types?[0].type?.name
                        ?.toPokemonTypeColor(),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const DetailScreen(),
                          arguments: {
                            'id': item?.url!
                                .split("pokemon")
                                .last
                                .replaceAll("/", "")
                          },
                          transition: Transition.cupertino,
                          duration: const Duration(
                            milliseconds: 800,
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -15,
                              right: -10,
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: SvgPicture.asset(
                                  'assets/icon/ic_pokeball.svg',
                                  color: Colors.white.withOpacity(0.4),
                                  width: 120,
                                  height: 120,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${item?.url?.split("pokemon").last.replaceAll("/", "")}.png",
                                progressIndicatorBuilder:
                                    (context, url, progress) {
                                  return Lottie.asset(
                                      "assets/lottie/pokeball_lottie.json");
                                },
                                width: 100,
                                height: 110,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${item?.name?[0].toUpperCase()}${item?.name?.substring(1)}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: controller
                                          .detailPokemon[index].types!
                                          .map((e) => Container(
                                                height: 25,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14.0,
                                                        vertical: 4.0),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Text(
                                                  '${e.type?.name?[0].toUpperCase()}${e.type?.name?.substring(1)}' ??
                                                      '-',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
