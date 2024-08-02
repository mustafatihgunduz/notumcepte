import 'package:flutter/material.dart';
import 'package:notumcepte/utility/constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  String? hintText;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: K.kHomePageHorizontalPadding,
        vertical: K.kHomePageVerticalPadding,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: K.kDropdownButtonTextStyle(context),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 1, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 1, color: Colors.black),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 1, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
