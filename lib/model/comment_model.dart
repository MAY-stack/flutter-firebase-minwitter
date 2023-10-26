import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String text, userName, userId;
  const Comment(
      {super.key,
      required this.text,
      required this.userName,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    // 'Comment' 위젯의 크기를 고정값(예: 100.0)으로 지정합니다.
    return const SizedBox(
      height: 100.0,
      child: Placeholder(),
    );
  }
}
