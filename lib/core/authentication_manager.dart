import 'package:auth_manager/core/cache_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  bool isLogin = false;

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}
