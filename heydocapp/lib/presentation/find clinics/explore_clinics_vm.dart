import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/clinic_model.dart';
import '../../domain/usecase/http_usecase/httpget/httpget_clinics_usecase.dart';

final exploreClinicsVMProvider = ChangeNotifierProvider(
    (ref) => ExploreClinicVM(ref.watch(getClinicsUseCaseProvider)));

class ExploreClinicVM extends ChangeNotifier {
  final GetClinicsUsecase _getClinicsUsecase;
  List<ClinicModel> clinics = [];
  bool isLoading = false;

  ExploreClinicVM(this._getClinicsUsecase) {
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
}
