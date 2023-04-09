import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heydocapp/presentation/find%20clinics/explore_clinics_vm.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../domain/models/clinic_model.dart';

class ExploreClinics extends ConsumerWidget {
  const ExploreClinics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final vm = ref.watch(exploreClinicsVMProvider);
        final list = vm.clinics;
        if (vm.isLoading) {
          return const Center(
              child: SpinKitSpinningLines(
            color: Colors.purple,
            size: 64,
          ));
        }
        return LiquidPullToRefresh(
          onRefresh: () {
            return vm.getClinics();
          },
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  //open booking page
                },
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: getClinicView(context, list[index]))),
              );
            },
            itemCount: list.length,
          ),
        );
      },
    );
  }

  Widget getClinicView(BuildContext context, ClinicModel clinic) {
    return Stack(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Image.network(
          // 'https://staticg.sportskeeda.com/editor/2022/02/2fa43-16452757358066-1920.jpg',
          clinic.pictureLink,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.transparent],
              stops: [0.0, 0.5]),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Clinic name',
                      clinic.clinicName,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      // 'Doctor Name',
                      clinic.doctorName,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
                // Text(
                //   'Rating',
                //   style: TextStyle(color: Colors.lightBlue),
                // ),
                RatingBar(
                  minRating: 1,
                  maxRating: 5,
                  initialRating: 4,
                  //  clinic.rating.toDouble(),
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemSize: 24,
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
                )
              ]),
        ),
      ),
    ]);
  }
}
