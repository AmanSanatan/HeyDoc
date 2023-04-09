import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/booking_model.dart';
import '../repository/http_repo.dart';

final postNewBookingUseCaseProvider =
    Provider((ref) => PostNewBookingUseCase(ref.watch(httpRepoProvider)));

class PostNewBookingUseCase {
  final HttpRepo _httpRepo;
  PostNewBookingUseCase(this._httpRepo);

  Future postNewBooking(BookingModel bookingModel) {
    const uri = '/booking/';
    return _httpRepo.post(uri, bookingModel);
  }
}
