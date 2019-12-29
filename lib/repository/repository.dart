import 'dart:async';
import 'package:kalaapp/constants/constant.dart';
import 'package:kalaapp/network/rest_client.dart';
import 'package:kalaapp/store/login/model.dart';
import 'package:kalaapp/helpers/shared_pref.dart';
// import 'package:sembast/sembast.dart';

class Repository {
  // api objects
  final DioClient _dioClient;
  final SharedPreferenceHelper _sharedPrefsHelper;

  Repository(this._dioClient, this._sharedPrefsHelper);


  Future<PostLogin> postLogin(url,{ data }) async {
     try {
      final res = await _dioClient.post(Constants.baseUrl + url, data: data);
      final authToken = PostLogin.fromJson(res);
      _sharedPrefsHelper.saveAuthToken(authToken.token);
      return authToken;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<String> getDataToken() {
   return _sharedPrefsHelper.authToken;
  }
}