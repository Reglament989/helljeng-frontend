import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  PackageInfo? packageInfo;

  _loadPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  void initState() {
    _loadPackageInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              "https://source.unsplash.com/random/640x640"),
                          child: InkWell(
                            onTap: () {},
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Adam Husein",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text("@adam00"))
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       ...List.generate(
              //           3,
              //           (_) => DecoratedBox(
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(15),
              //                   color: Colors.indigo),
              //               child: IconButton(
              //                   onPressed: () {},
              //                   icon: Icon(
              //                     Icons.more_sharp,
              //                     color: Colors.white,
              //                   ))))
              //     ],
              //   ),
              // ),
              Card(
                children: [
                  CardItem(
                    child: ListTile(
                      title: Text("Privacy"),
                      subtitle: Text("Who can see you, forwarding"),
                    ),
                  ),
                  CardItem(
                    child: ListTile(
                      onTap: () {},
                      title: Text("Security"),
                      subtitle: Text("2FA, password & email"),
                    ),
                  ),
                  CardItem(
                    child: ListTile(
                      onTap: () {},
                      title: Text("Notifications"),
                      subtitle: Text("Who can notify you & sounds"),
                    ),
                  ),
                ],
              ),
              Card(children: [
                CardItem(
                  child: ListTile(
                    onTap: () {},
                    title: Text("Themify"),
                    subtitle: Text("All about theming your app"),
                  ),
                ),
                CardItem(
                  child: ListTile(
                    onTap: () {},
                    title: Text("Themify"),
                    subtitle: Text("All about theming your app"),
                  ),
                ),
              ]),
              Card(children: [
                CardItem(
                  child: ListTile(
                    onTap: () {},
                    title: Text("Data and storage"),
                    subtitle: Text("How much app can save and what"),
                  ),
                ),
                CardItem(
                  child: ListTile(
                    onTap: () {},
                    title: Text("Networking"),
                    subtitle: Text("Setup like proxy etc (for nerds)"),
                  ),
                ),
              ]),
              Center(
                child: Text(
                    "Version ${packageInfo?.version}+${packageInfo?.buildNumber}"),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Card extends StatelessWidget {
  const Card({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.cyan[100]),
          child: Column(
            children: children,
          )),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}

class SettingsBar extends StatelessWidget {
  const SettingsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Settings",
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ),
      trailing: PopupMenuButton<String>(
        onSelected: (s) {},
        itemBuilder: (BuildContext context) {
          return {'About', 'Feedback'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    );
  }
}
