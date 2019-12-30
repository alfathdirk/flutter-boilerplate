import 'package:kalaapp/constants/constant.dart';
import 'package:kalaapp/helpers/shared_pref.dart';
import 'package:kalaapp/network/rest_client.dart';

import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import 'package:kalaapp/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
class NetworkModule {
  @provide
  @singleton
  Dio provideDio() => Dio()
    ..options.baseUrl = Constants.baseUrl
    ..options.connectTimeout = 5000
    ..options.receiveTimeout = 3000
    ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
    // ..interceptors.add(LogInterceptor(responseBody: true))
    ..interceptors.add(InterceptorsWrapper(onRequest: (Options options) async {
      var prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(Constants.auth_token);
      if (token != null) {
        options.headers.putIfAbsent('Authorization', () => token);
      } else {
        print('Auth token is null');
      }
    }));

  @provide
  @singleton
  DioClient provideDioClient() => DioClient(provideDio());

  @provide
  @singleton
  @asynchronous
  Future<SharedPreferences> provideSharedPreferences() async =>
      await SharedPreferences.getInstance();

  @provide
  @singleton
  SharedPreferenceHelper provideSharedPreferenceHelper() =>
      SharedPreferenceHelper(provideSharedPreferences());

  @provide
  @singleton
  Repository provideRepository() =>
      Repository(provideDioClient(), provideSharedPreferenceHelper());

}
