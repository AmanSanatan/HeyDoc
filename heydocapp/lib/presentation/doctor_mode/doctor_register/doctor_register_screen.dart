import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:image_picker/image_picker.dart';

import '../../../domain/models/patient_model.dart';

import '../../text_field.dart';
const loadingState=false;

class DoctorRegisterScreen extends ConsumerStatefulWidget {
  final PatientModel _patientModel;

  const DoctorRegisterScreen(this._patientModel, {super.key});

  @override
  ConsumerState<DoctorRegisterScreen> createState() =>
      _DoctorRegisterScreenState();
}

class _DoctorRegisterScreenState extends ConsumerState<DoctorRegisterScreen> {
  @override
  void initState() {
 
    super.initState();
  }

  final TextEditingController doctorName = TextEditingController();

  final TextEditingController doctorEmail = TextEditingController();

  final TextEditingController clinicName = TextEditingController();

  final TextEditingController phoneNumber = TextEditingController();

  final TextEditingController description = TextEditingController();

  final TextEditingController bookingPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register as a doctor!'),
      ),
      backgroundColor: Colors.white,
      body : loadingState
          ? const Center(
              child: SpinKitSpinningLines(
                color: Colors.purple,
                size: 64,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
              padding: EdgeInsets.only(
                right: width * 0.1,
                left: width * 0.1,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.05),
                    ),
                    TextInputWidget(
                      texthint: "Enter Doctor Name",
                      controller: doctorName,
                      textInputType: TextInputType.name,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                    ),
                    TextInputWidget(
                      texthint: "Enter Doctor Email",
                      controller: doctorEmail,
                      textInputType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                    ),
                    TextInputWidget(
                      texthint: "Enter Clinic Name",
                      controller: clinicName,
                      textInputType: TextInputType.name,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                    ),
                    TextInputWidget(
                      texthint: "Phone Number",
                      controller: phoneNumber,
                      textInputType: TextInputType.number,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                    ),
                    TextInputWidget(
                      texthint: "Description",
                      controller: description,
                      textInputType: TextInputType.multiline,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                    ),
                    TextInputWidget(
                      texthint: "Enter Booking Price",
                      controller: bookingPrice,
                      textInputType: TextInputType.number,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Wrap(children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        
                                      },
                                      child: const ListTile(
                                        leading: Icon(Icons.camera),
                                        title: Text('Take a picture'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        
                                      },
                                      child: const ListTile(
                                        leading: Icon(Icons.photo),
                                        title: Text('Pick from gallery'),
                                      ),
                                    ),
                                  ],
                                ),
                              ]);
                            });
                      },
                      child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Image.network(
                                "",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              'SELECT DOCTOR IMAGE',
                              style: TextStyle(fontSize: 16),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Wrap(children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                       
                                      },
                                      child: const ListTile(
                                        leading: Icon(Icons.camera),
                                        title: Text('Take a picture'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                       
                                      },
                                      child: const ListTile(
                                        leading: Icon(Icons.photo),
                                        title: Text('Pick from gallery'),
                                      ),
                                    ),
                                  ],
                                ),
                              ]);
                            });
                      },
                      child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Image.network(
                                "",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              'SELECT CLINIC IMAGE',
                              style: TextStyle(fontSize: 16),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width * 0.55,
                        padding: EdgeInsets.symmetric(
                          // horizontal: width * 0.2,
                          vertical: height * 0.5 * 0.05,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                    ),
                  ]),
            )),
    );
  }
}
