import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class AuthService{
  static Future<void> requestAuthentication() async {
    LocalAuthentication localAuthentication = LocalAuthentication();
    bool supportsBiometrics = await localAuthentication.canCheckBiometrics || await localAuthentication.isDeviceSupported();
    if(supportsBiometrics){
      try{
        // Future<List<BiometricType>> biometrics = localAuthentication.getAvailableBiometrics();
        bool authenticated = await localAuthentication.authenticate(
          localizedReason: "Password needed for authorization",
          options: const AuthenticationOptions(
            biometricOnly: false,
          ),
        );
        if(!authenticated){
          SystemNavigator.pop();
        }
      } catch(e){
        Get.snackbar(
          "Error!!!", 
          "An error occured while processing.",
        );
      }
    } else {}
  }
}