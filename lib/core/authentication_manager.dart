import 'package:auth_manager/core/cache_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class AuthenticationManager extends GetxController with CacheManager {
  var isLogin = false.obs;

  void logOut() {
    isLogin.value = false;
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogin.value = true;
    }
  }
}
