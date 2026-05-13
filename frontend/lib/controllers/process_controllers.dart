import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/api_services.dart';
class ProcessController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  final emailController = TextEditingController();
  final textController = TextEditingController();
  final urlController = TextEditingController();

  final isLoading = false.obs;
  final sessionId = ''.obs;
  final errorMessage = ''.obs;
  final isSuccess = false.obs;

  // Toggle between text input and URL input
  final isUrlMode = false.obs;

  void toggleMode() {
    isUrlMode.value = !isUrlMode.value;
    textController.clear();
    urlController.clear();
    errorMessage.value = '';
    isSuccess.value = false;
  }

  void reset() {
    emailController.clear();
    textController.clear();
    urlController.clear();
    sessionId.value = '';
    errorMessage.value = '';
    isSuccess.value = false;
    isUrlMode.value = false;
  }

  Future<void> submit() async {
    errorMessage.value = '';
    isSuccess.value = false;

    final email = emailController.text.trim();
    final text = textController.text.trim();
    final url = urlController.text.trim();

    // Validation
    if (email.isEmpty) {
      errorMessage.value = 'Please enter your email address.';
      return;
    }
    if (!GetUtils.isEmail(email)) {
      errorMessage.value = 'Please enter a valid email address.';
      return;
    }
    if (isUrlMode.value && url.isEmpty) {
      errorMessage.value = 'Please enter a URL.';
      return;
    }
    if (!isUrlMode.value && text.isEmpty) {
      errorMessage.value = 'Please enter some text to process.';
      return;
    }

    isLoading.value = true;

    try {
      final result = await _apiService.processText(
        email: email,
        text: isUrlMode.value ? '' : text,
        url: isUrlMode.value ? url : '',
      );

      sessionId.value = result['session_id'] ?? '';
      isSuccess.value = true;
    } on DioException catch (e) {
      if (e.response != null) {
        final detail = e.response?.data['detail'] ?? 'Something went wrong.';
        errorMessage.value = detail.toString();
      } else {
        errorMessage.value = 'Could not connect to server. Is the backend running?';
      }
    } catch (e) {
      errorMessage.value = 'Unexpected error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    textController.dispose();
    urlController.dispose();
    super.onClose();
  }
}