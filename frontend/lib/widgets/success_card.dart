import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccessCard extends StatelessWidget {
  final String sessionId;
  final String email;
  final VoidCallback onReset;

  const SuccessCard({
    super.key,
    required this.sessionId,
    required this.email,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        // Success icon
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF6C63FF).withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle_outline_rounded,
            color: Color(0xFF6C63FF),
            size: 40,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Processing Started!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Your text is being processed by AI.\nResults will be sent to:',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.45),
            fontSize: 14,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          email,
          style: const TextStyle(
            color: Color(0xFF6C63FF),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 28),

        // Session ID card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: const Color(0xFF6C63FF).withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SESSION ID',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.3),
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sessionId,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: sessionId));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Session ID copied!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Icon(Icons.copy_rounded,
                        color: Colors.white.withOpacity(0.4), size: 18),
                  )
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // Process another button
        SizedBox(
          width: double.infinity,
          height: 52,
          child: OutlinedButton(
            onPressed: onReset,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                  color: const Color(0xFF6C63FF).withOpacity(0.5)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'Process Another',
              style: TextStyle(
                color: Color(0xFF6C63FF),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}