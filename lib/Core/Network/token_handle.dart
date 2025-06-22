// import 'package:ajyal/Cache/cache_helper.dart';
// import 'package:ajyal/Core/utils/app_service_locator.dart';

// class TokenHandle {
//   final cacheHelper = getit<CacheHelper>();
//   static const String tokenKey = 'token';
//   // final CacheHelper _cacheHelper = CacheHelper();

//   // static const String tokenKey = 'token';

//   // حفظ التوكن
//   Future<void> setToken(String token) async {
//     await cacheHelper.saveData(key: tokenKey, value: token);
//   }

//   // حذف التوكن
//   Future<void> clearToken() async {
//     await cacheHelper.removeData(key: tokenKey);
//   }

//   // جلب التوكن
//   dynamic getToken() async {
//     return cacheHelper.getDataString(key: tokenKey);
//   }
// }
import 'package:ajyal/Cache/cache_helper.dart';

class TokenHandler {
  final CacheHelper cacheHelper;

  TokenHandler(this.cacheHelper);

  static const String _tokenKey = "auth_token";

  Future<void> saveToken(String token) async {
    await cacheHelper.saveData(key: _tokenKey, value: token);
  }

  String? getToken() {
    return cacheHelper.getDataString(key: _tokenKey);
  }

  Future<void> clearToken() async {
    await cacheHelper.removeData(key: _tokenKey);
  }

  bool hasToken() {
    return cacheHelper.getDataString(key: _tokenKey) != null;
  }
}
