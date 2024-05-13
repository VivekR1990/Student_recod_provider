import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon,
      required this.validator,
      this.keyboardType,
      this.maxLine});
  final String label;
  final int? maxLine;
  final TextInputType? keyboardType;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLines: maxLine ?? 1,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white54,
        // suffixIcon: IconButton(
        //   onPressed: suffixOnpress,
        //   icon: Icon(suffixicon),
        // ),
        prefixIcon: Icon(icon),
        labelText: label,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff21209C),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
