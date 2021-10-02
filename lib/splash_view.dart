import 'package:auth_manager/core/authentication_manager.dart';
import 'package:auth_manager/home_view.dart';
import 'package:auth_manager/login/login_view.dart';
import 'package:auth_manager/onboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
                Text('Loading...'),
              ],
            ),
          ));
        } else {
          if (snapshot.hasError)
            return Scaffold(
                body: Center(child: Text('Error: ${snapshot.error}')));
          else
            return OnBoard();
        }
      },
    );
  }
}
