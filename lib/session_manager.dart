import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionManager {
  final _storage = const FlutterSecureStorage();

  static const _userTokenKey = 'userToken';

  Future<void> saveUserToken(String token) async {
    await _storage.write(key: _userTokenKey, value: token);
  }

  Future<String?> getUserToken() async {
    return await _storage.read(key: _userTokenKey);
  }

  Future<void> clearUserToken() async {
    await _storage.delete(key: _userTokenKey);
  }
}
