import 'package:flutter/material.dart';

class RoomView extends StatelessWidget {
  const RoomView({Key? key}) : super(key: key);
  static String route = "/room";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          actions: [],
          title: ListTile(
            onTap: () {},
            title: Text(
              ModalRoute.of(context)!.settings.arguments as String,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                )),
            leading: Hero(
              tag: ModalRoute.of(context)!.settings.arguments as String,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: Image.network(
                          "https://source.unsplash.com/random/640x640")
                      .image,
                ),
              ),
            ),
          )),
      body: ColoredBox(color: Colors.red, child: ListView()),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

