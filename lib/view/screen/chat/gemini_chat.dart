import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:training_app/linkapi.dart';

class GeminiChat extends StatelessWidget {
  GeminiChat({super.key});
  final model = GenerativeModel(model: 'Gemini_pro', apiKey: AppLink.geminiApiKey);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}