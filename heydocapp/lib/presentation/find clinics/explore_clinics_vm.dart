import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/main.dart';
import 'package:heydocapp/presentation/clinic%20details/clinic_details_screen.dart';

import '../../domain/models/clinic_model.dart';
import '../../domain/usecase/http_usecase/httpget/httpget_clinics_usecase.dart';

final exploreClinicsVMProvider = ChangeNotifierProvider((ref) =>
    ExploreClinicVM(
        ref.watch(getClinicsUseCaseProvider),
        ref.watch(clickedClinicStateProvider),
        ref.watch(navigatorKeyProvider)));

final clickedClinicStateProvider = Provider((ref) => ClickedClinicState());

class ExploreClinicVM extends ChangeNotifier {
  final GetClinicsUsecase _getClinicsUsecase;
  final ClickedClinicState _clickedClinicState;
  final GlobalKey<NavigatorState> navigatorKey;
  List<ClinicModel> clinics = [];
  bool isLoading = false;

  ExploreClinicVM(
      this._getClinicsUsecase, this._clickedClinicState, this.navigatorKey) {
    getClinics();
  }

  void toggleLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future getClinics() async {
    toggleLoadingState();
    final response = await _getClinicsUsecase.getClinics();
    clinics = response;
    print('clinic response aa gya!');
    toggleLoadingState();
  }

  void onClinicClicked(int index) {
    _clickedClinicState.clickedClinic = clinics[index];
    navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (BuildContext context) {
      return const ClinicDetailsScreen();
    }));
  }
}

class ClickedClinicState {
  ClinicModel? clickedClinic;
}
