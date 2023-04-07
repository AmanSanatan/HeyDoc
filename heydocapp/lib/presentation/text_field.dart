import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String texthint;
  final TextInputType textInputType;
  const TextInputWidget(
      {super.key,
      required this.controller,
      required this.texthint,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
          hintText: texthint,
          filled: true,
          fillColor: const Color.fromARGB(255, 244, 244, 244),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black),
          )),
    );
  }
}
