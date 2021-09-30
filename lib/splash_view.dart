import 'package:auth_manager/core/authentication_manager.dart';
import 'package:auth_manager/home_view.dart';
import 'package:auth_manager/login/login_view.dart';
import 'package:auth_manager/onboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Future<void> getSettings() async {
    _authmanager.checkLoginStatus();
    await Future.delayed(Duration(seconds: 3));
  }

/*   @override
  void initState() {
    super.initState();
    getSettings();
  } */

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSettings(),
      builder: (context, snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(child: Text('Please wait its loading...')));
        } else {
          if (snapshot.hasError)
            return Scaffold(
                body: Center(child: Text('Error: ${snapshot.error}')));
          else
            return OnBoard(); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }
}
