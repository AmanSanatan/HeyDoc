import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PatientProfilePage extends ConsumerWidget {
  const PatientProfilePage({super.key});
final isLoading = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Stack(children: [
        isLoading
            ? const Center(
                child: SpinKitSpinningLines(
                color: Colors.purple,
                size: 64,
              ))
            : LiquidPullToRefresh(
                onRefresh: () {
                  return Future(() => null);
                },
                child: SafeArea(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          leading: IconButton(
                              icon: const Icon(Icons.logout_outlined),
                              onPressed: () {
                              }),
                          actions: [
                            IconButton(
                                icon: const Icon(Icons.local_hospital),
                                onPressed: () {
                                  
                                }),
                          ],
                          title: const Text("MY PROFILE"),
                          centerTitle: true,
                          backgroundColor: Colors.deepPurple,
                          expandedHeight: 350,
                          stretch: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              height: 250,
                              color: Colors.grey[200],
                              child: Stack(children: [
                                SizedBox(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                        'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ClipRRect(
                                  child: BackdropFilter(
                                    filter: UI.ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Wrap(children: [
                                                    Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () async{
                                                            final ImagePicker picker = ImagePicker();
                                                            final XFile? image = await picker.pickImage(source : ImageSource.camera);
                                                          },
                                                          child: const ListTile(
                                                            leading: Icon(
                                                                Icons.camera),
                                                            title: Text(
                                                                'Take a picture'),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () async{
                                                            final ImagePicker picker = ImagePicker();
                                                            final XFile? image = await picker.pickImage(source : ImageSource.gallery);
                                                          },
                                                          child: const ListTile(
                                                            leading: Icon(
                                                                Icons.photo),
                                                            title: Text(
                                                                'Pick from gallery'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ]);
                                                });
                                          },
                                          child: SizedBox(
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image.network(
                                             
                                                  'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 14,
                                          ),
                                        ),
                                        Text(
                                              'Name',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                              'Email',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        )
                      ];
                    },
                    body: Container(
                      color: Colors.grey[200],
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Column(children: [
                                Text(
                                    "12:00"),
                                Text(
                                    "AM"),
                              ]),
                            ),
                            title: Text(
                               'doctor',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                               'clinic',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                
                              },
                              child: const Text(
                                "JOIN",
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ),
                          );
                        },
                        itemCount: 0,
                      ),
                    ),
                  ),
                ),
              ),
      ]),
    );
  }
}