// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinematl_app/presentation/misc/constant.dart';
import 'package:flutter/material.dart';

class CinemaTextfield extends StatelessWidget {
  final String labelText;

  final TextEditingController controller;
  final bool obscureText;
  const CinemaTextfield({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: ghostWhite),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ghostWhite),
        ),
      ),
    );
  }
}
