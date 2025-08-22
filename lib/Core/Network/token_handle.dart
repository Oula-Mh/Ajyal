import 'package:ajyal/Cache/cache_helper.dart';

class TokenHandler {
  final CacheHelper cacheHelper;

  TokenHandler(this.cacheHelper);

  static const String parentTokenKey = "parent_token";
  static const String studentTokenKey = "student_token";

  Future<void> saveToken(String key, String token) async {
    await cacheHelper.saveData(key: key, value: token);
  }

  String? getToken(String key) {
    return cacheHelper.getDataString(key: key);
  }

  Future<void> clearToken(String key) async {
    await cacheHelper.removeData(key: key);
  }

  bool hasToken(String key) {
    return cacheHelper.getDataString(key: key) != null;
  }
}

//===================
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// final storage = FlutterSecureStorage();

// // Save token
// await storage.write(key: 'auth_token', value: 'your_jwt_token');

// // Read token
// String? token = await storage.read(key: 'auth_token');

// // Delete token (on logout)
// await storage.delete(key: 'auth_token');
