import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final loginUsecaseProvider = Provider<LoginUsecase>((ref) {
  return LoginUsecase(ref.read(authRepositoryProvider));
});

class LoginUsecase {
  LoginUsecase(this.authRepository);
  final AuthRepository authRepository;

  Future googleLogin() {
    return authRepository.googleLogin();
  }

  Future emailLogin(String email, String password) {
    return authRepository.emailLogin(email, password);
  }
}
