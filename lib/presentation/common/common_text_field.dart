import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget(
      {super.key, this.isPassword = false, this.hintText = 'HintText', required this.controller});
  final bool isPassword;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
            hintText: hintText,

            filled: true,
            focusedBorder: const OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: const OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            border: const OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            fillColor: const Color(0xFFEAE8F3)),
      ),
    );
  }
}
