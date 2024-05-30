import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokeapi/const/color.dart';
import 'package:pokeapi/helper/extension_method.dart';
import 'package:pokeapi/screen/detail/detail_controller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) {
        if (controller.state == DetailViewState.loading) {
          return Scaffold(
            backgroundColor: controller.detailPokemon?.types?[0].type?.name
                ?.toPokemonTypeColor(),
            body: Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: controller.detailPokemon?.types?[0].type?.name
              ?.toPokemonTypeColor(),
          appBar: AppBar(
            backgroundColor: controller.detailPokemon?.types?[0].type?.name
                ?.toPokemonTypeColor(),
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Stack(
                  children: [
                    Positioned(
                      right: -45,
                      top: 150,
                      child: SvgPicture.asset(
                        'assets/icon/ic_pokeball.svg',
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      left: 30,
                      top: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${controller.detailPokemon?.forms?[0].name?[0].toUpperCase()}${controller.detailPokemon?.forms?[0].name?.substring(1)}' ??
                                    "-",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 35,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      controller.detailPokemon?.types?.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 6.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0, vertical: 4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text(
                                        '${controller.detailPokemon?.types?[index].type?.name?[0].toUpperCase()}${controller.detailPokemon?.types?[index].type?.name?.substring(1)}' ??
                                            '-',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '#${controller.formatter.format(int.parse(controller.dataArgument['id']))}' ??
                                "-",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 280,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 35, bottom: 10, right: 15, left: 15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TabBar(
                              controller: controller.tabController,
                              tabAlignment: TabAlignment.center,
                              dividerHeight: 0,
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: Colors.black,
                              labelStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              unselectedLabelColor: Colors.grey,
                              splashFactory: NoSplash.splashFactory,
                              tabs: const [
                                Tab(
                                  child: Text(
                                    "About",
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Base Stats",
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Moves",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.sp),
                            Expanded(
                              child: TabBarView(
                                controller: controller.tabController,
                                children: [
                                  SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Text(
                                                    "Species",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 6,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Text(
                                                    '${controller.detailPokemon?.speciesModel?.name?[0].toUpperCase()}${controller.detailPokemon?.speciesModel?.name?.substring(1)}',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Text(
                                                    "Height",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 6,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Text(
                                                    '${controller.detailPokemon?.height.toString()} m' ??
                                                        '-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.0.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Text(
                                                    "Weight",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 6,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Text(
                                                    '${controller.detailPokemon?.weight.toString()} kg' ??
                                                        '-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Text(
                                                    "Abilities",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 6,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Wrap(
                                                      alignment:
                                                          WrapAlignment.start,
                                                      direction:
                                                          Axis.horizontal,
                                                      children: controller
                                                          .detailPokemon!
                                                          .abilities!
                                                          .map(
                                                            (e) => Text(
                                                              '${e.ability?.name?[0].toUpperCase()}${e.ability?.name?.substring(1)} ',
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          )
                                                          .toList()),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            "Description",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            controller.flavourText.isEmpty
                                                ? '-'
                                                : '${controller.flavourText[0]?.replaceAll('\n', ' ').replaceAll('\f', ' ')}${controller.flavourText[1]?.replaceAll('\n', ' ').replaceAll('\f', ' ')}${controller.flavourText[2]?.replaceAll('\n', ' ').replaceAll('\f', ' ')}',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'ATK',
                                                style: TextStyle(
                                                  color: controller
                                                      .detailPokemon
                                                      ?.types?[0]
                                                      .type
                                                      ?.name
                                                      ?.toPokemonTypeColor(),
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              controller.detailPokemon
                                                      ?.stats?[1].baseStat
                                                      .toString() ??
                                                  '-',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.6,
                                              child: LinearProgressIndicator(
                                                value: controller.detailPokemon!
                                                        .stats![1].baseStat! /
                                                    255,
                                                backgroundColor: controller
                                                    .detailPokemon
                                                    ?.types?[0]
                                                    .type
                                                    ?.name
                                                    ?.toPokemonTypeColor()
                                                    .withOpacity(0.4),
                                                valueColor: AlwaysStoppedAnimation(
                                                    controller.detailPokemon
                                                        ?.types?[0].type?.name
                                                        ?.toPokemonTypeColor()),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'DEF',
                                                style: TextStyle(
                                                  color: controller
                                                      .detailPokemon
                                                      ?.types?[0]
                                                      .type
                                                      ?.name
                                                      ?.toPokemonTypeColor(),
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              controller.detailPokemon
                                                      ?.stats?[2].baseStat
                                                      .toString() ??
                                                  '-',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.6,
                                              child: LinearProgressIndicator(
                                                value: controller.detailPokemon!
                                                        .stats![2].baseStat! /
                                                    255,
                                                backgroundColor: controller
                                                    .detailPokemon
                                                    ?.types?[0]
                                                    .type
                                                    ?.name
                                                    ?.toPokemonTypeColor()
                                                    .withOpacity(0.4),
                                                valueColor: AlwaysStoppedAnimation(
                                                    controller.detailPokemon
                                                        ?.types?[0].type?.name
                                                        ?.toPokemonTypeColor()),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'HP',
                                                style: TextStyle(
                                                  color: controller
                                                      .detailPokemon
                                                      ?.types?[0]
                                                      .type
                                                      ?.name
                                                      ?.toPokemonTypeColor(),
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              controller.detailPokemon
                                                      ?.stats?[0].baseStat
                                                      .toString() ??
                                                  '-',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.6,
                                              child: LinearProgressIndicator(
                                                value: controller.detailPokemon!
                                                        .stats![0].baseStat! /
                                                    255,
                                                backgroundColor: controller
                                                    .detailPokemon
                                                    ?.types?[0]
                                                    .type
                                                    ?.name
                                                    ?.toPokemonTypeColor()
                                                    .withOpacity(0.4),
                                                valueColor: AlwaysStoppedAnimation(
                                                    controller.detailPokemon
                                                        ?.types?[0].type?.name
                                                        ?.toPokemonTypeColor()),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'SP-ATK',
                                                style: TextStyle(
                                                  color: controller
                                                      .detailPokemon
                                                      ?.types?[0]
                                                      .type
                                                      ?.name
                                                      ?.toPokemonTypeColor(),
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              controller.detailPokemon
                                                      ?.stats?[3].baseStat
                                                      .toString() ??
                                                  '-',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.6,
                                              child: LinearProgressIndicator(
                                                value: 80 / 255,
                                                backgroundColor: controller
                                                    .detailPokemon
                                                    ?.types?[0]
                                                    .type
                                                    ?.name
                                                    ?.toPokemonTypeColor()
                                                    .withOpacity(0.4),
                                                valueColor: AlwaysStoppedAnimation(
                                                    controller.detailPokemon
                                                        ?.types?[0].type?.name
                                                        ?.toPokemonTypeColor()),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'SP-DEF',
                                                style: TextStyle(
                                                  color: controller
                                                      .detailPokemon
                                                      ?.types?[0]
                                                      .type
                                                      ?.name
                                                      ?.toPokemonTypeColor(),
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              controller.detailPokemon
                                                      ?.stats?[4].baseStat
                                                      .toString() ??
                                                  '-',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.6,
                                              child: LinearProgressIndicator(
                                                value: controller.detailPokemon!
                                                        .stats![4].baseStat! /
                                                    255,
                                                backgroundColor: controller
                                                    .detailPokemon
                                                    ?.types?[0]
                                                    .type
                                                    ?.name
                                                    ?.toPokemonTypeColor()
                                                    .withOpacity(0.4),
                                                valueColor: AlwaysStoppedAnimation(
                                                    controller.detailPokemon
                                                        ?.types?[0].type?.name
                                                        ?.toPokemonTypeColor()),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'SPD',
                                                style: TextStyle(
                                                  color: controller
                                                      .detailPokemon
                                                      ?.types?[0]
                                                      .type
                                                      ?.name
                                                      ?.toPokemonTypeColor(),
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              controller.detailPokemon
                                                      ?.stats?[5].baseStat
                                                      .toString() ??
                                                  '-',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.6,
                                              child: LinearProgressIndicator(
                                                value: controller.detailPokemon!
                                                        .stats![5].baseStat! /
                                                    255,
                                                backgroundColor: controller
                                                    .detailPokemon
                                                    ?.types?[0]
                                                    .type
                                                    ?.name
                                                    ?.toPokemonTypeColor()
                                                    .withOpacity(0.4),
                                                valueColor: AlwaysStoppedAnimation(
                                                    controller.detailPokemon
                                                        ?.types?[0].type?.name
                                                        ?.toPokemonTypeColor()),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        controller.detailPokemon?.moves?.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 6.0),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14.0, vertical: 4.0),
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          '${index + 1}. ${controller.detailPokemon?.moves?[index].move?.name?[0].toUpperCase()}${controller.detailPokemon?.moves?[index].move?.name?.substring(1)}' ??
                                              '-',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${controller.dataArgument['id']}.png",
                          width: 250,
                          height: 250,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Lottie.asset(
                                "assets/lottie/pokeball_lottie.json",
                                width: 200,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height,
                    child: Stack(
                      children: [
                        Positioned(
                          right: -45,
                          top: 150,
                          child: SvgPicture.asset(
                            'assets/icon/ic_pokeball.svg',
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        Positioned(
                          right: 30,
                          left: 30,
                          top: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${controller.detailPokemon?.forms?[0].name?[0].toUpperCase()}${controller.detailPokemon?.forms?[0].name?.substring(1)}' ??
                                        "-",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 35,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.detailPokemon?.types?.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.only(right: 6.0),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14.0, vertical: 4.0),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.3),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Text(
                                            '${controller.detailPokemon?.types?[index].type?.name?[0].toUpperCase()}${controller.detailPokemon?.types?[index].type?.name?.substring(1)}' ??
                                                '-',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '#${controller.formatter.format(int.parse(controller.dataArgument['id']))}' ??
                                    "-",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.network(
                                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${controller.dataArgument['id']}.png",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.contain,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Lottie.asset(
                                        "assets/lottie/pokeball_lottie.json",
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  width: 300,
                                  height: 250,
                                  padding: const EdgeInsets.only(
                                      top: 35, bottom: 10, right: 15, left: 15),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      TabBar(
                                        controller: controller.tabController,
                                        tabAlignment: TabAlignment.center,
                                        dividerHeight: 0,
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        labelColor: Colors.black,
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        unselectedLabelColor: Colors.grey,
                                        splashFactory: NoSplash.splashFactory,
                                        tabs: const [
                                          Tab(
                                            child: Text(
                                              "About",
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              "Base Stats",
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              "Moves",
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.sp),
                                      Expanded(
                                        child: TabBarView(
                                          controller: controller.tabController,
                                          children: [
                                            SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Flexible(
                                                          flex: 2,
                                                          fit: FlexFit.tight,
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0),
                                                            child: Text(
                                                              "Species",
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors.grey,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 6,
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0),
                                                            child: Text(
                                                              '${controller.detailPokemon?.speciesModel?.name?[0].toUpperCase()}${controller.detailPokemon?.speciesModel?.name?.substring(1)}',
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Flexible(
                                                          flex: 2,
                                                          fit: FlexFit.tight,
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0),
                                                            child: Text(
                                                              "Height",
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors.grey,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 6,
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0),
                                                            child: Text(
                                                              '${controller.detailPokemon?.height.toString()} m' ??
                                                                  '-',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 14.0.sp,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Flexible(
                                                          flex: 2,
                                                          fit: FlexFit.tight,
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0),
                                                            child: Text(
                                                              "Weight",
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors.grey,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 6,
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0),
                                                            child: Text(
                                                              '${controller.detailPokemon?.weight.toString()} kg' ??
                                                                  '-',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Flexible(
                                                          flex: 2,
                                                          fit: FlexFit.tight,
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0),
                                                            child: Text(
                                                              "Abilities",
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors.grey,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 6,
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0),
                                                            child: Wrap(
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                direction:
                                                                    Axis.horizontal,
                                                                children: controller
                                                                    .detailPokemon!
                                                                    .abilities!
                                                                    .map(
                                                                      (e) => Text(
                                                                        '${e.ability?.name?[0].toUpperCase()}${e.ability?.name?.substring(1)} ',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14.sp,
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                        ),
                                                                      ),
                                                                    )
                                                                    .toList()),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 16.0,
                                                    ),
                                                    Text(
                                                      "Description",
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 8.0,
                                                    ),
                                                    Text(
                                                      controller.flavourText.isEmpty
                                                          ? '-'
                                                          : '${controller.flavourText[0]?.replaceAll('\n', ' ').replaceAll('\f', ' ')}${controller.flavourText[1]?.replaceAll('\n', ' ').replaceAll('\f', ' ')}${controller.flavourText[2]?.replaceAll('\n', ' ').replaceAll('\f', ' ')}',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10.0,
                                                left: 10.0,
                                                right: 10.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'ATK',
                                                          style: TextStyle(
                                                            color: controller
                                                                .detailPokemon
                                                                ?.types?[0]
                                                                .type
                                                                ?.name
                                                                ?.toPokemonTypeColor(),
                                                            fontSize: 14.0.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.detailPokemon
                                                                ?.stats?[1].baseStat
                                                                .toString() ??
                                                            '-',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14.0.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.35.sp,
                                                        child:
                                                            LinearProgressIndicator(
                                                          value: controller
                                                                  .detailPokemon!
                                                                  .stats![1]
                                                                  .baseStat! /
                                                              255,
                                                          backgroundColor: controller
                                                              .detailPokemon
                                                              ?.types?[0]
                                                              .type
                                                              ?.name
                                                              ?.toPokemonTypeColor()
                                                              .withOpacity(0.4),
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                                  controller
                                                                      .detailPokemon
                                                                      ?.types?[0]
                                                                      .type
                                                                      ?.name
                                                                      ?.toPokemonTypeColor()),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'DEF',
                                                          style: TextStyle(
                                                            color: controller
                                                                .detailPokemon
                                                                ?.types?[0]
                                                                .type
                                                                ?.name
                                                                ?.toPokemonTypeColor(),
                                                            fontSize: 14.0.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.detailPokemon
                                                                ?.stats?[2].baseStat
                                                                .toString() ??
                                                            '-',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14.0.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.35.sp,
                                                        child:
                                                            LinearProgressIndicator(
                                                          value: controller
                                                                  .detailPokemon!
                                                                  .stats![2]
                                                                  .baseStat! /
                                                              255,
                                                          backgroundColor: controller
                                                              .detailPokemon
                                                              ?.types?[0]
                                                              .type
                                                              ?.name
                                                              ?.toPokemonTypeColor()
                                                              .withOpacity(0.4),
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                                  controller
                                                                      .detailPokemon
                                                                      ?.types?[0]
                                                                      .type
                                                                      ?.name
                                                                      ?.toPokemonTypeColor()),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'HP',
                                                          style: TextStyle(
                                                            color: controller
                                                                .detailPokemon
                                                                ?.types?[0]
                                                                .type
                                                                ?.name
                                                                ?.toPokemonTypeColor(),
                                                            fontSize: 14.0.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.detailPokemon
                                                                ?.stats?[0].baseStat
                                                                .toString() ??
                                                            '-',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14.0.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.35.sp,
                                                        child:
                                                            LinearProgressIndicator(
                                                          value: controller
                                                                  .detailPokemon!
                                                                  .stats![0]
                                                                  .baseStat! /
                                                              255,
                                                          backgroundColor: controller
                                                              .detailPokemon
                                                              ?.types?[0]
                                                              .type
                                                              ?.name
                                                              ?.toPokemonTypeColor()
                                                              .withOpacity(0.4),
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                                  controller
                                                                      .detailPokemon
                                                                      ?.types?[0]
                                                                      .type
                                                                      ?.name
                                                                      ?.toPokemonTypeColor()),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'SP-ATK',
                                                          style: TextStyle(
                                                            color: controller
                                                                .detailPokemon
                                                                ?.types?[0]
                                                                .type
                                                                ?.name
                                                                ?.toPokemonTypeColor(),
                                                            fontSize: 14.0.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.detailPokemon
                                                                ?.stats?[3].baseStat
                                                                .toString() ??
                                                            '-',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14.0.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.35.sp,
                                                        child:
                                                            LinearProgressIndicator(
                                                          value: 80 / 255,
                                                          backgroundColor: controller
                                                              .detailPokemon
                                                              ?.types?[0]
                                                              .type
                                                              ?.name
                                                              ?.toPokemonTypeColor()
                                                              .withOpacity(0.4),
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                                  controller
                                                                      .detailPokemon
                                                                      ?.types?[0]
                                                                      .type
                                                                      ?.name
                                                                      ?.toPokemonTypeColor()),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'SP-DEF',
                                                          style: TextStyle(
                                                            color: controller
                                                                .detailPokemon
                                                                ?.types?[0]
                                                                .type
                                                                ?.name
                                                                ?.toPokemonTypeColor(),
                                                            fontSize: 14.0.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.detailPokemon
                                                                ?.stats?[4].baseStat
                                                                .toString() ??
                                                            '-',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14.0.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.35.sp,
                                                        child:
                                                            LinearProgressIndicator(
                                                          value: controller
                                                                  .detailPokemon!
                                                                  .stats![4]
                                                                  .baseStat! /
                                                              255,
                                                          backgroundColor: controller
                                                              .detailPokemon
                                                              ?.types?[0]
                                                              .type
                                                              ?.name
                                                              ?.toPokemonTypeColor()
                                                              .withOpacity(0.4),
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                                  controller
                                                                      .detailPokemon
                                                                      ?.types?[0]
                                                                      .type
                                                                      ?.name
                                                                      ?.toPokemonTypeColor()),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'SPD',
                                                          style: TextStyle(
                                                            color: controller
                                                                .detailPokemon
                                                                ?.types?[0]
                                                                .type
                                                                ?.name
                                                                ?.toPokemonTypeColor(),
                                                            fontSize: 14.0.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.detailPokemon
                                                                ?.stats?[5].baseStat
                                                                .toString() ??
                                                            '-',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14.0.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.35.sp,
                                                        child:
                                                            LinearProgressIndicator(
                                                          value: controller
                                                                  .detailPokemon!
                                                                  .stats![5]
                                                                  .baseStat! /
                                                              255,
                                                          backgroundColor: controller
                                                              .detailPokemon
                                                              ?.types?[0]
                                                              .type
                                                              ?.name
                                                              ?.toPokemonTypeColor()
                                                              .withOpacity(0.4),
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                                  controller
                                                                      .detailPokemon
                                                                      ?.types?[0]
                                                                      .type
                                                                      ?.name
                                                                      ?.toPokemonTypeColor()),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20),
                                                ],
                                              ),
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount: controller
                                                  .detailPokemon?.moves?.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 6.0),
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 14.0,
                                                          vertical: 4.0),
                                                  alignment: Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.3),
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(8.0),
                                                  ),
                                                  child: Text(
                                                    '${index + 1}. ${controller.detailPokemon?.moves?[index].move?.name?[0].toUpperCase()}${controller.detailPokemon?.moves?[index].move?.name?.substring(1)}' ??
                                                        '-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
