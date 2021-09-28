import 'package:auth_manager/core/cache_manager.dart';

class AuthenticationManager with CacheManager {
  bool isLogin = false;

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}
