import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenma_info_school/screens/chat_message.dart';
import 'package:greenma_info_school/screens/live_chat.dart';

class ChatBubble extends StatefulWidget {
  ChatMessage chatMessage;

  ChatBubble({@required this.chatMessage});

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    print(widget.chatMessage.image);
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.type == MessageType.Receiver
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: widget.chatMessage.type == MessageType.Receiver
                ? BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
                : BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            border: Border.all(color: new Color(0xffFF5C00)),
            color: (widget.chatMessage.type == MessageType.Receiver
                ? Color(0xffE4E4E4)
                : Colors.orange.shade200),
          ),
          padding: EdgeInsets.all(16),
          child: (widget.chatMessage.message == "question")
              ? Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Submit Your doubt")),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color:
                  (widget.chatMessage.type == MessageType.Receiver
                      ? Color(0xffE4E4E4)
                      : Colors.orange.shade200),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      'Take a Picture',
                      style: TextStyle(fontSize: 10),
                    ),
                    color: Colors.orange.shade200,
                    textColor: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color:
                  (widget.chatMessage.type == MessageType.Receiver
                      ? Color(0xffE4E4E4)
                      : Colors.orange.shade200),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      'Choose from Gallery',
                      style: TextStyle(fontSize: 10),
                    ),
                    color: Colors.orange.shade200,
                    textColor: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          )
              : (widget.chatMessage.image == "" ||
              widget.chatMessage.image == null)
              ? Text(widget.chatMessage.message)
              : Column(
            children: [
              Image.asset(widget.chatMessage.image),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(widget.chatMessage.message))
            ],
          ),
        ),
      ),
    );
  }
}
