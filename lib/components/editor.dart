import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final TextInputType? keyboardType;
  final Color? iconColor;
  final String? hint;
  final TextEditingController? controller;

  const Editor(
    {super.key, this.controller, this.label, this.hint, this.icon, this.iconColor, this.keyboardType}
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 36.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(
            icon, 
            color: iconColor ?? Colors.grey
          ) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: keyboardType ?? TextInputType.text,
      ),
    );
  }
}
