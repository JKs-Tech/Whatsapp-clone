import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/common_file/utils/utils.dart';
import 'package:whatsapp/futures/auth/screens/otp_screen.dart';

final AuthRepositoryProvider = Provider((_ref) {
  AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
});

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({required this.auth, required this.firestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: ((PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          }),
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (((String verificationId, int? resendToken) async {
            await Navigator.pushNamed(context, OTPScreen.routeName,
                arguments: verificationId);
          })),
          codeAutoRetrievalTimeout: ((String verificationId) {}));
    } on FirebaseAuthException catch (e) {
      showSnackbar(context: context, content: e.message!);
    }
  }
}
