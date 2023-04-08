import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/main.dart';
import 'package:heydocapp/presentation/navigation_screen/bottom_nav_screen.dart';

import '../../domain/usecase/login_usecase.dart';
import '../../utils/auth_response.dart';

final loginScreenVMProvider = ChangeNotifierProvider<LoginScreenVM>((ref) {
  return LoginScreenVM(ref.watch(loginUsecaseProvider),
      ref.watch(scaffoldMessengerKeyProvider), ref.watch(navigatorKeyProvider));
});

class LoginScreenVM extends ChangeNotifier {
  final LoginUsecase loginUsecase;
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey;
  final GlobalKey<NavigatorState> navigatorKey;

  LoginScreenVM(
      this.loginUsecase, this.rootScaffoldMessengerKey, this.navigatorKey);

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool loadingState = false;

  void toggleLoadingState() {
    loadingState = !loadingState;
    notifyListeners();
  }

  void emailLogin() async {
    toggleLoadingState();
    final AuthResponse result = await loginUsecase.emailLogin(
        emailTextController.text, passwordTextController.text);
    result.when(
      success: (userCredential) {
        rootScaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content:
                Text("Sucessfully logged in as ${userCredential.user?.email}"),
          ),
        );
        navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
          return const BottomNavScreen();
        }));
      },
      faliure: (message) => rootScaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      ),
    );
    toggleLoadingState();
  }

  void googleLogin() async {
    toggleLoadingState();
    final AuthResponse result = await loginUsecase.googleLogin();
    result.when(
      success: (userCredential) =>
          rootScaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content:
              Text("Sucessfully logged in as ${userCredential.user?.email}"),
        ),
      ),
      faliure: (message) => rootScaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      ),
    );
    toggleLoadingState();
  }
}
