import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hj_frontend/pages/home/view/settings.dart';
import 'package:hj_frontend/pages/room/view/view.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static String route = "/home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final _pageController = PageController();
  final appBars = [SearchBar(), SearchBar(), SettingsBar()];

  void _onItemTapped(int index) {
    print("tapped $index");
    setState(() {
      _pageController.animateToPage(index,
          curve: Curves.easeOut, duration: Duration(milliseconds: 300));
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 10,
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(scale: animation, child: child),
          child: appBars[_selectedIndex],
        ),
      ),
      body: PageView(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: const [
            RoomList(),
            ColoredBox(color: Colors.amber),
            SettingsPage()
          ]),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 7),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            child: BottomNavigationBar(
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.public,
                      size: 28,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat,
                      size: 28,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 28,
                    ),
                    label: ""),
              ],
            ),
          )),
    );
  }
}

class RoomList extends StatefulWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList>
    with AutomaticKeepAliveClientMixin<RoomList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 75,
        itemBuilder: (context, index) => RoomTitle(
              lastMessage: "Hello everybody",
              roomTitle: "Room $index",
              avatar: "https://source.unsplash.com/random/640x640",
              countUnread: index,
            ));
  }

  @override
  bool get wantKeepAlive => true;
}

class RoomTitle extends StatefulWidget {
  const RoomTitle(
      {Key? key,
      required this.roomTitle,
      required this.lastMessage,
      required this.avatar,
      required this.countUnread})
      : super(key: key);
  final String roomTitle;
  final String lastMessage;
  final String avatar;
  final int countUnread;

  @override
  State<RoomTitle> createState() => _RoomTitleState();
}

class _RoomTitleState extends State<RoomTitle> {
  late final Image _image;
  bool _loading = true;

  @override
  void initState() {
    _image = Image.network(
      widget.avatar,
    );
    _image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((_, __) => mounted
            ? setState(() {
                _loading = false;
              })
            : null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 2000),
      child: ListTile(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.of(context)
              .pushNamed(RoomView.route, arguments: widget.roomTitle);
        },
        onLongPress: () {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: new Icon(Icons.photo),
                        title: new Text('Photo'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: new Icon(Icons.music_note),
                        title: new Text('Music'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: new Icon(Icons.videocam),
                        title: new Text('Video'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: new Icon(Icons.share),
                        title: new Text('Share'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
        },
        title: Text(widget.roomTitle),
        subtitle: Text(widget.lastMessage),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12)),
          child: Text(
            widget.countUnread < 999 ? "${widget.countUnread}" : "999",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        leading: Hero(
          tag: widget.roomTitle,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _loading
                ? Shimmer(
                    gradient: LinearGradient(colors: [
                      Colors.black26,
                      Colors.black38,
                      Colors.black45,
                      Colors.black54
                    ]),
                    child: CircleAvatar(
                      radius: 25,
                    ))
                : CircleAvatar(
                    radius: 25,
                    backgroundImage: _image.image,
                  ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(
        Icons.search,
        color: Colors.black,
      ),
      trailing: Icon(Icons.edit),
      title: TextField(
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search room',
            hintStyle:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
