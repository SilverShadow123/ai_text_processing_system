import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/process_controllers.dart';

enum FieldType { email, text, url }

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final FieldType fieldType;
  final int maxLines;

  const InputField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.keyboardType,
    required this.fieldType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProcessController>();

    final TextEditingController textController = switch (fieldType) {
      FieldType.email => controller.emailController,
      FieldType.text => controller.textController,
      FieldType.url => controller.urlController,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF6C63FF),
            fontSize: 11,
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textController,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white, fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.2),
              fontSize: 14,
            ),
            prefixIcon: Icon(icon,
                color: Colors.white.withOpacity(0.3), size: 20),
            filled: true,
            fillColor: const Color(0xFF1A1A2E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                  color: Color(0xFF6C63FF), width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }
}