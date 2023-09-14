import 'package:flutter/material.dart';
import '../../constants/global_variables.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Button({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        backgroundColor: GlobalVariables.primaryColor,
      ),
      child: Text(text),
    );
  }
}
