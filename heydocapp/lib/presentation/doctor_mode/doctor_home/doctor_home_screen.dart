import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

const loadingState=false;

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: Stack(children: [
        loadingState
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
                              icon: const Icon(Icons.navigate_before),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          actions: [
                            PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem(
                                    onTap: () {
                                     
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.edit_attributes),
                                        Text('Edit clinic'),
                                      ],
                                    ),
                                  ),
                                  // PopupMenuItem(
                                  //   onTap: () {},
                                  //   child: Row(
                                  //     children: const [
                                  //       Icon(Icons.edit_attributes),
                                  //       Text('Edit Doctor'),
                                  //     ],
                                  //   ),
                                  // ),
                                ];
                              },
                            ),
                          ],
                          title: const Text("MY Clinic"),
                          centerTitle: true,
                          backgroundColor: Colors.black,
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
                                        SizedBox(
                                          height: 200,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                            
                                                'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                            fit: BoxFit.contain,
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
                                        Text(
                                         
                                              '0',
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
                               
                              ]),
                            ),
                            title: Text(
                               'patient',
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
                        
                      ),
                    ),
                  ),
                ),
              ),
      ]),
    );
  }
}
