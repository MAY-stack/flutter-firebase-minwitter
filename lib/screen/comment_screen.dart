import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minwitter/model/comment_model.dart';
import 'package:minwitter/widget/comments_widget.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   // TwitterScreen가 초기화될 때 코멘트를 가져오도록 설정
  //   fetchComments().then((fetchedComments) {
  //     setState(() {
  //       comments = fetchedComments;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            const Menu1(),
            const Menu2(),
            const Menu3(),
            CommentForm(),
          ],
        )),
      ),
    );
  }
}

class Menu1 extends StatelessWidget {
  const Menu1({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.home),
    );
  }
}

class Menu2 extends StatelessWidget {
  const Menu2({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.person),
    );
  }
}

class Menu3 extends StatelessWidget {
  const Menu3({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //로그아웃 할지 확인
        //로그아웃 처리
        //초기화면 이동
      },
      icon: const Icon(Icons.logout),
    );
  }
}
