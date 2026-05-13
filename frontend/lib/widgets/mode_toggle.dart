import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/process_controllers.dart';

class ModeToggle extends StatelessWidget {
  const ModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProcessController>();

    return Obx(() => Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _tab(
            label: 'Text Input',
            icon: Icons.notes_rounded,
            isActive: !controller.isUrlMode.value,
            onTap: () {
              if (controller.isUrlMode.value) controller.toggleMode();
            },
          ),
          _tab(
            label: 'URL',
            icon: Icons.link_rounded,
            isActive: controller.isUrlMode.value,
            onTap: () {
              if (!controller.isUrlMode.value) controller.toggleMode();
            },
          ),
        ],
      ),
    ));
  }

  Widget _tab({
    required String label,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF6C63FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 16,
                  color: isActive
                      ? Colors.white
                      : Colors.white.withOpacity(0.35)),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: isActive
                      ? Colors.white
                      : Colors.white.withOpacity(0.35),
                  fontSize: 13,
                  fontWeight:
                  isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}