import 'package:answerly_ai/widgets/answer_section.dart';
import 'package:answerly_ai/widgets/side_navbar.dart';
import 'package:answerly_ai/widgets/sources_section.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavbar(),
          const SizedBox(width: 100),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  question,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                SourcesSection(),
                SizedBox(height: 24),
                AnswerSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
