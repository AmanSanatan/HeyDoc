import '../repository/auth_repository.dart';

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
