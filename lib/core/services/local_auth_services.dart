import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();
  Future<bool> checkBiometrcis() async {
    return await _auth.canCheckBiometrics;
  }

  Future<List<BiometricType>> gatAvailalbeBiometrcis() async {
    return await _auth.getAvailableBiometrics();
  }

  Future<bool> authenticate({String reason = "Authenticate"}) async {
    try {
      final canCheckBiometrics = await _auth.canCheckBiometrics;
      if (!canCheckBiometrics) {
        throw PlatformException(
          code: 'NotAvailable',
          message: 'Biometric authentication is not available on this device',
        );
      }

      // Check if there are enrolled biometrics
      final availableBiometrics = await _auth.getAvailableBiometrics();
      if (availableBiometrics.isEmpty) {
        throw PlatformException(
          code: 'NotEnrolled',
          message:
              'No biometrics enrolled. Please set up fingerprint or face ID in device settings',
        );
      }

      final isAuthenticated = await _auth.authenticate(
        localizedReason: reason,
      );
      return isAuthenticated;
    } on PlatformException catch (_) {
      rethrow; // Re-throw to let the cubit handle the error
    }
  }

  Future<void> stopAtuhentication() async {
    await _auth.stopAuthentication();
  }
}
