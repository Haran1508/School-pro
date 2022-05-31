import 'package:flutter/material.dart';
import 'package:greenma_info_school/screens/chat_bubble.dart';
import 'package:greenma_info_school/screens/chat_message.dart';


enum MessageType {
  Sender,
  Receiver,
}

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> chatMessage = [
    ChatMessage(
        message:
        "Hi Indhu \n Send us an image from the subject, \n and we will cleared for your doubt.",
        type: MessageType.Receiver,
        image: "assets/image/banner.jpeg"),
    ChatMessage(
        message: "Submit Your Question", type: MessageType.Receiver, image: ""),
    ChatMessage(message: "question", type: MessageType.Receiver, image: ""),
    ChatMessage(
        message: "I need help with this question",
        type: MessageType.Sender,
        image: "assets/image/banner.jpeg"),
  ];

  void showModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Color(0xff737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      height: 4,
                      width: 50,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Chat"),
        backgroundColor: new Color(0xffFF5C00),

      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: chatMessage.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ChatBubble(
              chatMessage: chatMessage[index],
            );
          },
        ),
      ),
    );
  }
}
