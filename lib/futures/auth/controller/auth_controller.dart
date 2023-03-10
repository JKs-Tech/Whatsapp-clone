import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/futures/auth/repositry/auth_repositry.dart';

final authControllerProvider = Provider(((ref) {
  final authRepository = ref.watch(AuthRepositoryProvider);
  return AuthController(authRepository: authRepository);
}));

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }
}
