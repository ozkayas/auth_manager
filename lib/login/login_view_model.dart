import 'package:auth_manager/login/service/login_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginViewModel extends GetxController {
  late final LoginService _loginService;

  @override
  void onInit() {
    super.onInit();
    _loginService = LoginService();
  }
}
