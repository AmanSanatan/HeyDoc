import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse.success(UserCredential userCredential) =
      AuthSuccess;
  const factory AuthResponse.faliure(String message) = AuthFaliure;
}
