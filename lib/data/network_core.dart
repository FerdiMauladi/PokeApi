import 'package:dio/dio.dart';
import 'package:pokeapi/const/app_const.dart';

class NetworkCore {
  Dio dio = Dio();

  NetworkCore() {
    dio.options = BaseOptions(
        baseUrl: AppConstant.baseUrl,
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
        sendTimeout: const Duration(minutes: 3),
        headers: {
          "Accept": "application/json"
        }
    );
    // dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}