import 'package:auth_manager/login/model/login_request_model.dart';
import 'package:auth_manager/login/service/login_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginViewModel extends GetxController {
  late final LoginService _loginService;

  @override
  void onInit() {
    super.onInit();
    _loginService = LoginService();
  }

  Future<void> fetchLogin(String email, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(email: email, password: password));

    if (response != null) {
      //Response will be cached

      // Navigate to home view
    }
  }
}
