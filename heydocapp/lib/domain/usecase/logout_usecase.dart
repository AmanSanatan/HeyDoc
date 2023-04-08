import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final logoutUseCaseProvider =
    Provider((ref) => LogoutUsecase(ref.watch(authRepositoryProvider)));

class LogoutUsecase {
  final AuthRepository authRepository;
  LogoutUsecase(this.authRepository);

  Future logout() {
    return authRepository.logout();
  }
}
