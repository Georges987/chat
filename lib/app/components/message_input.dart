import 'package:flutter/material.dart';

class MessageInputField extends StatelessWidget {
  const MessageInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            child: Row(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Entrez votre message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              // Logique pour envoyer le message
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
