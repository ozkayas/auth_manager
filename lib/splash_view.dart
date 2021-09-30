import 'package:auth_manager/core/authentication_manager.dart';
import 'package:auth_manager/home_view.dart';
import 'package:auth_manager/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Future<void> navigateToRoute() async {
    _authmanager.checkLoginStatus();
    if (_authmanager.isLogin) {
      await Future.delayed(Duration(seconds: 2));
      Get.to(() => HomeView());
    } else {
      await Future.delayed(Duration(seconds: 2));
      Get.to(() => LoginView());
    }
  }

  @override
  void initState() {
    super.initState();
    navigateToRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
