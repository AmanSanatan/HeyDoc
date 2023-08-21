import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repository/auth_repository.dart';
import '../../utils/auth_response.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<AuthResponse> emailRegister(String email, String password) async {
    try {
      var result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return AuthResponse.success(result);
    } on FirebaseAuthException catch (e) {
      return AuthResponse.faliure(e.message ?? 'some error occured');
    } catch (e) {
      return const AuthResponse.faliure('some error occured');
    }
  }

  @override
  Future<AuthResponse> googleRegister() async {
    try {
      final GoogleSignInAccount? newGoogleUser = await GoogleSignIn().signIn();
      if (newGoogleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await newGoogleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        var result =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return AuthResponse.success(result);
      } else {
        return const AuthResponse.faliure("please select a account");
      }
    } on FirebaseAuthException catch (e) {
      return AuthResponse.faliure(e.message ?? 'some error occured');
    } catch (e) {
      return const AuthResponse.faliure('some error occured');
    }
  }

  @override
  Future logout() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<AuthResponse> emailLogin(String email, String password) async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AuthResponse.success(result);
    } on FirebaseAuthException catch (e) {
      return AuthResponse.faliure(e.message ?? 'some error occured');
    } catch (e) {
      return const AuthResponse.faliure('some error occured');
    }
  }

  @override
  Future<AuthResponse> googleLogin() async {
    try {
      final GoogleSignInAccount? newGoogleUser = await GoogleSignIn().signIn();
      if (newGoogleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await newGoogleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        var result =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return AuthResponse.success(result);
      } else {
        return const AuthResponse.faliure("please select a account");
      }
    } on FirebaseAuthException catch (e) {
      return AuthResponse.faliure(e.message ?? 'some error occured');
    } catch (e) {
      return const AuthResponse.faliure('some error occured');
    }
  }

  @override
  Future<User?> getUser() async {
    var user = FirebaseAuth.instance.currentUser;
    return user;
  }

  @override
  Stream<User?> handleAuthState() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
