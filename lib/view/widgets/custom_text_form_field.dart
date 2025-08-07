import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController titleController;
  final String labelText;
  final TextInputAction textInputAction;

  const CustomTextFormField({
    super.key,
    required this.titleController,
    required this.labelText,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText é obrigatório!';
        }
        return null;
      },
      textInputAction: textInputAction,
    );
  }
}
