import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String sender;
  final String message;

  const MessageWidget({
    Key? key,
    required this.sender,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            sender == 'Moi' ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: sender == 'Moi' ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
