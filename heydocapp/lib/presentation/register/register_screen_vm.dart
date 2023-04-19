import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/main.dart';
import 'package:heydocapp/presentation/navigation_screen/bottom_nav_screen.dart';

import '../../domain/models/patient_model.dart';
import '../../domain/usecase/http_usecase/httppost/httppost_patient_usecase.dart';
import '../../domain/usecase/register_usecase.dart';
import '../../utils/auth_response.dart';

final registerScreenVMProvider =
    ChangeNotifierProvider<RegisterScreenVM>((ref) {
  return RegisterScreenVM(
    ref.watch(registerUsecaseProvider),
    ref.watch(scaffoldMessengerKeyProvider),
    ref.watch(postPatientUseCaseProvider),
    ref.watch(navigatorKeyProvider),
  );
});

class RegisterScreenVM extends ChangeNotifier {
  final RegisterUsecase registerUsecase;
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey;
  final GlobalKey<NavigatorState> navigatorKey;
  final PostPatientUsecase _postPatientUsecase;
  RegisterScreenVM(this.registerUsecase, this.rootScaffoldMessengerKey,
      this._postPatientUsecase, this.navigatorKey);

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  final TextEditingController userNameTextController = TextEditingController();
  bool loadingState = false;

  void toggleLoadingState() {
    loadingState = !loadingState;
    notifyListeners();
  }

  void emailRegister() async {
    toggleLoadingState();
    final AuthResponse result = await registerUsecase.emailRegister(
        emailTextController.text, passwordTextController.text);
    _handleAuthResult(result);
  }

  void googleRegister() async {
    toggleLoadingState();
    final AuthResponse result = await registerUsecase.googleRegister();
    _handleAuthResult(result);
  }

  void _handleAuthResult(AuthResponse result) {
    result.when(
      success: (userCredential) async {
        await _postPatient(userCredential);
        navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
          return const BottomNavScreen();
        }));
        toggleLoadingState();
        rootScaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content:
                Text("Sucessfully logged in as ${userCredential.user?.email}"),
          ),
        );
      },
      faliure: (message) => rootScaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      ),
    );
  }

  Future _postPatient(UserCredential userCredential) async {
    final patientModel = PatientModel(
        name: userCredential.user!.displayName ?? userNameTextController.text,
        email: userCredential.user!.email!,
        uid: userCredential.user!.uid,
        isDoctor: 'false');
    await _postPatientUsecase.postPatient(patientModel);
  }
}
