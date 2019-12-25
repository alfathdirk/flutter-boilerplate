import 'dart:async';
import 'dart:convert';
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

  // Future<List<Post>> findPostById(int id) {
  //   //creating filter
  //   List<Filter> filters = List();

  //   //check to see if dataLogsType is not null
  //   if (id != null) {
  //     Filter dataLogTypeFilter = Filter.equal(DBConstants.FIELD_ID, id);
  //     filters.add(dataLogTypeFilter);
  //   }

  //   //making db call
  //   return _postDataSource
  //       .getAllSortedByFilter(filters: filters)
  //       .then((posts) => posts)
  //       .catchError((error) => throw error);
  // }

  // Future<int> insert(Post post) => _postDataSource
  //     .insert(post)
  //     .then((id) => id)
  //     .catchError((error) => throw error);

  // Future<int> update(Post post) => _postDataSource
  //     .update(post)
  //     .then((id) => id)
  //     .catchError((error) => throw error);

  // Future<int> delete(Post post) => _postDataSource
  //     .update(post)
  //     .then((id) => id)
  //     .catchError((error) => throw error);
}

// class PostsList {
//   static Future<PostList> fromJson(decode) {}
// }
