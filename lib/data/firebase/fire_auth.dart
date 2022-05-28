import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> varifyPhone({
    required String phone,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) =>
            verificationCompleted(credential),
        timeout: const Duration(seconds: 60),
        verificationFailed: (FirebaseAuthException e) => verificationFailed(e),
        codeSent: (String verificationId, int? resendToken) =>
            codeSent(verificationId),
        codeAutoRetrievalTimeout: (String verificationId) =>
            codeAutoRetrievalTimeout(verificationId),
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
