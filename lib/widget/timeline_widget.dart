// //타임라인 보여주는 위젯
// class TimeLine extends StatelessWidget {
//   final List<Comment> comments;
//   const TimeLine({super.key, required this.comments});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         SizedBox(
//           height: 30,
//           child: Text('여기는 타임라인'),
//         ),
//       ],
//     );
//   }
// }

// //코멘트 패치 함수
// Future<List<Comment>> fetchComments() async {
//   // Firestore 컬렉션과 문서 경로 설정
//   CollectionReference commentsCollection =
//       FirebaseFirestore.instance.collection('comments');

//   // 코멘트 데이터를 가져오는 쿼리
//   QuerySnapshot querySnapshot = await commentsCollection.get();

//   // 코멘트 데이터를 파싱
//   List<Comment> comments = querySnapshot.docs.map((doc) {
//     // Firestore 문서에서 필요한 데이터 추출
//     String text = doc.get('text');
//     String userId = doc.get('userId');
//     String userName = doc.get('userName');

//     print('text: $text, userId: $userId, userName: $userName');

//     // Comment 객체를 생성하여 반환
//     return Comment(
//       text: text,
//       userId: userId,
//       userName: userName,
//     );
//   }).toList();

//   return comments;
// }
