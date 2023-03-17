import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.validate,
    required this.controller,
    required this.icon,
    required this.text, 
   
  });

  final String? Function(String?) validate;
  final TextEditingController controller;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 17.0, right: 17.0, top: 0, bottom: 0),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: icon,
          hintText: text,
          filled: true,
          fillColor: Color.fromARGB(83, 234, 233, 231).withOpacity(0.4),
        ),
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: validate,
      ),
    );
  }
}
