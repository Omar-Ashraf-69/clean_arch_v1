import 'dart:convert';

import 'package:clean_arch_test/core/database/cache/cache_helper.dart';
import 'package:clean_arch_test/core/errors/expentions.dart';
import 'package:clean_arch_test/features/user/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cacheHelper;
  final String key = "cachedUser";
  UserLocalDataSource({required this.cacheHelper});
  Future<UserModel> getUser() {
    final cachedUser = cacheHelper.getDataString(key: key);
    if (cachedUser != null) {
      return Future.value(UserModel.fromJson(json.decode(cachedUser)));
    } else {
      throw CacheExeption(errorMessage: "NO Internet connection");
    }
  }

  void saveUser({required UserModel user}) {
    cacheHelper.saveData(key: key, value: json.encode(user.toJson()));
  }
}
