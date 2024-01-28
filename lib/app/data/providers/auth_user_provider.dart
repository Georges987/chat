import 'package:get/get.dart';

import '../models/auth_user_model.dart';

class AuthUserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return AuthUser.fromJson(map);
      if (map is List)
        return map.map((item) => AuthUser.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<AuthUser?> getAuthUser(int id) async {
    final response = await get('authuser/$id');
    return response.body;
  }

  Future<Response<AuthUser>> postAuthUser(AuthUser authuser) async =>
      await post('authuser', authuser);
  Future<Response> deleteAuthUser(int id) async => await delete('authuser/$id');
}
