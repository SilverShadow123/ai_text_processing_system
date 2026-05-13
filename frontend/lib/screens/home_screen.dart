import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/process_controllers.dart';
import '../widgets/input_field.dart';
import '../widgets/submit_button.dart';
import '../widgets/success_card.dart';
import '../widgets/mode_toggle.dart';

class HomeScreen extends GetView<ProcessController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 40),

              // Success card or form
              Obx(() => controller.isSuccess.value
                  ? SuccessCard(
                sessionId: controller.sessionId.value,
                email: controller.emailController.text,
                onReset: controller.reset,
              )
                  : _buildForm()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF6C63FF).withOpacity(0.5)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'AI POWERED',
            style: TextStyle(
              color: Color(0xFF6C63FF),
              fontSize: 11,
              letterSpacing: 2.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Text\nProcessing.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.w800,
            height: 1.1,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Submit text or a URL and receive an AI-generated\nsummary and key points directly to your inbox.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.45),
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email field
        const InputField(
          label: 'EMAIL ADDRESS',
          hint: 'you@example.com',
          icon: Icons.mail_outline_rounded,
          keyboardType: TextInputType.emailAddress,
          fieldType: FieldType.email,
        ),
        const SizedBox(height: 20),

        // Mode toggle (Text / URL)
        const ModeToggle(),
        const SizedBox(height: 20),

        // Text or URL field based on mode
        Obx(() => controller.isUrlMode.value
            ? const InputField(
          label: 'WEBSITE URL',
          hint: 'https://example.com/article',
          icon: Icons.link_rounded,
          keyboardType: TextInputType.url,
          fieldType: FieldType.url,
        )
            : const InputField(
          label: 'INPUT TEXT',
          hint: 'Paste or type your text here...',
          icon: Icons.notes_rounded,
          keyboardType: TextInputType.multiline,
          fieldType: FieldType.text,
          maxLines: 6,
        )),

        const SizedBox(height: 12),

        // Error message
        Obx(() => controller.errorMessage.value.isNotEmpty
            ? Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.red.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Icon(Icons.error_outline,
                  color: Colors.redAccent, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  controller.errorMessage.value,
                  style: const TextStyle(
                      color: Colors.redAccent, fontSize: 13),
                ),
              ),
            ],
          ),
        )
            : const SizedBox.shrink()),

        const SizedBox(height: 8),

        // Submit button
        const SubmitButton(),

        const SizedBox(height: 24),

        // Info note
        Center(
          child: Text(
            'Results will be emailed to you after processing.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.25),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}