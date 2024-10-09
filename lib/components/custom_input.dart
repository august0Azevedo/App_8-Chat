import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  bool isObscure;
  String labelText;
  TextEditingController controller;

  CustomInput({super.key, this.isObscure = false, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        style: const TextStyle(color: Colors.white), // Define a cor do texto como branca
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), // Define a cor da borda como branca
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), // Define a cor da borda como branca
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), // Define a cor da borda como branca
          ),
          hintText: labelText,
          hintStyle: const TextStyle(color: Colors.white), // Define a cor do hint text como branca
        ),
      ),
    );
  }
}