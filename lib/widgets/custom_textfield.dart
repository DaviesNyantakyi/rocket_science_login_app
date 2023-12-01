import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hinText;
  final Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.hinText,
    required this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: Colors.black45),
        hintText: widget.hinText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
