import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    required this.fieldTitle,
    required this.labelText,
    required this.onSaved,
    required this.validator,
  });

  final String fieldTitle;
  final String labelText;
  final void Function(String? value) onSaved;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(top: 12),
      child: Column(
        spacing: 8,
        crossAxisAlignment: .start,
        children: <Widget> [
          Text(
            fieldTitle,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: labelText,
              helperText: ' ',
              border: OutlineInputBorder(),
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }

}
