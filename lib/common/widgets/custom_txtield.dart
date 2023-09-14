import '../../constants/global_variables.dart';

import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const Textfield(
      {super.key, 
      required this.controller, 
      required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val) {},
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: GlobalVariables.secondaryColor), // Customize focused border color
        ),
      ),
    );
  }
}
