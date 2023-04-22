import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/presentation/find%20clinics/explore_clinics_vm.dart';

import '../../domain/models/clinic_model.dart';

final clinicDetailsVMProvider = Provider.autoDispose((ref) {
  return ClinicDetailsVM(ref.watch(clickedClinicStateProvider).clickedClinic!);
});

class ClinicDetailsVM {
  final ClinicModel clinicModel;
  ClinicDetailsVM(this.clinicModel);
}
