import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final registerUsecaseProvider = Provider((ref) {
  return RegisterUsecase(ref.read(authRepositoryProvider));
});

class RegisterUsecase {
  RegisterUsecase(this.authRepository);
  final AuthRepository authRepository;

  Future googleRegister() {
    return authRepository.googleRegister();
  }

  Future emailRegister(String email, String password) {
    return authRepository.emailRegister(email, password);
  }
}
