import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';

final LocalAuthentication auth = LocalAuthentication();

final Logger logger = Logger();

Future<bool> checkBiometrics() async {
  // 1. Check if the device can even support biometrics (e.g., has a sensor)
  final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;

  if (canAuthenticateWithBiometrics) {
    logger.d("The devices support biometrics: $canAuthenticateWithBiometrics");
  } else {
    logger.d(
      "The devices do not support biometrics: $canAuthenticateWithBiometrics",
    );
  }

  // 2. Combine with general device authentication (PIN/Pattern/Password)
  final bool canAuthenticate =
      canAuthenticateWithBiometrics || await auth.isDeviceSupported();

  if (canAuthenticate) {
    logger.d("The devices is capable: $canAuthenticate");
  } else {
    logger.d("The devices is not capable: $canAuthenticate");
  }

  return canAuthenticate;
}

Future<bool> authenticateUser() async {
  try {
    return await auth.authenticate(
      localizedReason: 'Confirm your identity to proceed to login.',
      options: const AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
        sensitiveTransaction: true,
      ),
    );
  } catch (e) {
    logger.d("Authentication Error: $e");
    return false;
  }
}
