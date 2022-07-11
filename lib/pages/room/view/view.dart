import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoomView extends StatelessWidget {
  const RoomView({Key? key}) : super(key: key);
  static String route = "/room";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ))
        ],
        leadingWidth: double.infinity,
        titleSpacing: -5,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Hero(
              tag: ModalRoute.of(context)!.settings.arguments as String,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: Image.network(
                          "https://source.unsplash.com/random/640x640")
                      .image,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          ModalRoute.of(context)!.settings.arguments as String,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.cyan[100]!,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Message"),
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              IconButton(onPressed: () {}, icon: Icon(Icons.send)),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.amber),
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 4.0),
                child: ListView.builder(
                    reverse: true,
                    itemBuilder: (context, index) => MessageBubble(
                          out: index.isEven,
                          senderName: "Sender #$index",
                          text: "I love you",
                          datetime: DateTime.now(),
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key,
      required this.senderName,
      required this.text,
      required this.datetime,
      required this.out})
      : super(key: key);
  final String senderName;
  final String text;
  final DateTime datetime;
  final bool out;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: out ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: out ? Colors.indigo.shade600 : Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(19),
                    topLeft: out ? Radius.circular(19) : Radius.zero,
                    bottomLeft: Radius.circular(19),
                    bottomRight: out ? Radius.zero : Radius.circular(19),
                  ),
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 35),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: out ? Colors.white : Colors.black, fontSize: 14),
                  ),
                ),
              ),
              Positioned(
                  bottom: 9,
                  right: 12,
                  child: Text(
                    DateFormat("HH:mm").format(datetime),
                    style: TextStyle(
                        fontSize: 11,
                        color: out ? Colors.white54 : Colors.black54),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class Triangle extends CustomPainter {
  final Color backgroundColor;
  Triangle(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = backgroundColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
