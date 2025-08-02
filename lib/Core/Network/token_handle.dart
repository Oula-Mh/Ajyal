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

//===================
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// final storage = FlutterSecureStorage();

// // Save token
// await storage.write(key: 'auth_token', value: 'your_jwt_token');

// // Read token
// String? token = await storage.read(key: 'auth_token');

// // Delete token (on logout)
// await storage.delete(key: 'auth_token');
