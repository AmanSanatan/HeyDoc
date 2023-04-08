import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final getUserUseCaseProvider =
    Provider((ref) => GetUserUsecase(ref.watch(authRepositoryProvider)));

class GetUserUsecase {
  final AuthRepository authRepository;
  GetUserUsecase(this.authRepository);
  Future<User?> getUser() {
    return authRepository.getUser();
  }
}
