import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CommentForm extends StatelessWidget {
  // final void Function(String) onCommentSubmitted;

  CommentForm({super.key});

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _commentController,
            decoration: const InputDecoration(
              hintText: '이 영화 어땠나요?',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            String comment = _commentController.text;
            if (comment.isNotEmpty) {
              submitComment(comment); // 서버로 댓글을 전송
              _commentController.clear();
            }
          },
          child: const Text('댓글 작성'),
        ),
      ],
    );
  }
}

//감상 등록 함수
Future<void> submitComment(String comment) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference comments = firestore.collection('comments');
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print('로그인이 필요합니다.');
    return;
  }
  try {
    await comments.add({
      'text': comment,
      'timestamp': FieldValue.serverTimestamp(),
      'userName': user.displayName ?? 'Anonymous',
      'userId': user.uid,
    });
    print('댓글이 성공적으로 등록되었습니다.');
  } catch (e) {
    print('댓글 등록에 실패했습니다. 오류: $e');
  }
}
