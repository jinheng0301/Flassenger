import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flassenger/screens/chat_screen.dart';
import 'package:flassenger/widgets/message_bubble.dart';

final _firestore = FirebaseFirestore.instance;

class MessagesStream extends StatelessWidget {
  const MessagesStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      //在你的代码中，通过以下方式监听 Firebase 数据：
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs.reversed;
          final currentUser = loggedInUser!.email;

          // 有新数据到达时执行这里的代码
          // 处理数据并构建UI，比如显示聊天消息
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message['text'];
            final messageSender = message['sender'];
            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
            );

            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              children: messageBubbles,
            ),
          );
        } else {
          // 当没有数据或数据正在加载时执行这里的代码
          // 显示加载指示器
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
            ),
          );
        }
      },
    );
  }
}
