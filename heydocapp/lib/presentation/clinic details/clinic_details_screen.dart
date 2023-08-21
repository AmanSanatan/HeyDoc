import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/presentation/clinic%20details/clinic_details_vm.dart';
import 'package:heydocapp/presentation/meet%20booking/book_session.dart';

class ClinicDetailsScreen extends ConsumerWidget {
  const ClinicDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clinic = ref.watch(clinicDetailsVMProvider).clinicModel;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.only(left: 8),
                child: RatingBar(
                  minRating: 1,
                  maxRating: 5,
                  initialRating: 4,
                  // clinic.rating.toDouble(),
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemSize: 36,
                  onRatingUpdate: (rating) {},
                  ratingWidget: RatingWidget(
                    empty: const Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                    half: const Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    full: const Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ]),
            InkWell(
              onTap: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return BookSession(clinic);
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey,
            ),
            child: Image.network(
              clinic.pictureLink,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  clinic.clinicName,
                  style: const TextStyle(fontSize: 36, color: Colors.black),
                ),
              ]),
              Text(
                clinic.description,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            ]),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          Container(
            margin: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey,
            ),
            child: Image.network(
              clinic.doctorImage,
              fit: BoxFit.contain,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              clinic.clinicName,
              style: const TextStyle(fontSize: 36, color: Colors.black),
            ),
          ]),
          const Padding(
            padding: EdgeInsets.all(8),
          ),
        ],
      ),
    );
  }
}
