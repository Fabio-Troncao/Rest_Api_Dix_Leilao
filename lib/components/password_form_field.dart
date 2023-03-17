import 'package:flutter/material.dart';

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({
    super.key,
    required this.validate,
    required this.controller,
    required this.icon,
    required this.text, 
    required this.passwordVisibility,
    this.hideText=false, 
   
  });

  final String? Function(String?) validate;
  final TextEditingController controller;
  final Widget icon;
  final String text;
  final bool hideText;
  final Function passwordVisibility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 17.0, right: 17.0, top: 0, bottom: 0),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: icon, 
          suffixIcon: GestureDetector(
            onTap: ()=> passwordVisibility(),
            child: Icon(hideText ? Icons.visibility_off : Icons.visibility),),
          hintText: text,
          filled: true,
          fillColor: const Color.fromARGB(83, 234, 233, 231).withOpacity(0.4),
        ),
        obscureText: hideText,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: validate,
      ),
    );
  }
}
