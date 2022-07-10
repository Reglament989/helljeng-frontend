import 'package:flutter/material.dart';
import 'package:hj_frontend/pages/home/view/view.dart';
import 'package:hj_frontend/pages/login/view/view.dart';
import 'package:hj_frontend/pages/room/view/view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ))),
      routes: {
        HomeView.route: (context) => const HomeView(),
        LoginView.route: (context) => const LoginView(),
        RoomView.route: (context) => const RoomView()
      },
      home: const HomeView(),
    );
  }
}
