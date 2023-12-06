import 'package:scape/app/data/provider/api_interface.dart';

class AuthRepository {
  final ScapeApiInterface api;

  AuthRepository(this.api);

  Future<Map> loginWithGoogle() async => api.loginWithGoogle();
  Future<Map> refreshAccessToken(String refreshToken) async =>
      api.refreshAccessToken(refreshToken);
}
