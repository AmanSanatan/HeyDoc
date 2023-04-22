import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  return AuthRepositoryImpl();
});

abstract class AuthRepository {
  Future emailLogin(String email, String password);
  Future googleLogin();
  Future emailRegister(String email, String password);
  Future googleRegister();
  Future logout();
  Future<User?> getUser();
  Stream<User?> handleAuthState();
}
