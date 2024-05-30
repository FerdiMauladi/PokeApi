import 'package:get/get.dart';
import 'package:pokeapi/data/network_core.dart';
import 'package:pokeapi/data/repository/repository_impl.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore());
    Get.put<RepositoryImpl>(RepositoryImpl());
  }
}
