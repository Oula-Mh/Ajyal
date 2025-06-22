abstract class Api {
  Future<Map<String, dynamic>> get(String endPoint);
  Future<Map<String, dynamic>> post(String endPoint, Map data);
}
