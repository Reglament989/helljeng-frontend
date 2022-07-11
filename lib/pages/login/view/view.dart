import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:hj_frontend/pages/home/view/view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static String route = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color.fromRGBO(195, 226, 255, 1),
              Color.fromRGBO(241, 179, 239, 0)
            ])),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              top: 30,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(HomeView.route);
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Form(), SSOWidgets()],
            )
          ],
        ),
      ),
    );
  }
}

class SSOWidgets extends StatelessWidget {
  const SSOWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(161, 198, 232, 1)),
            child: const Text(
              "Sign in",
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: ui.FontWeight.bold),
            )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(
                        fillColor: Color.fromRGBO(161, 198, 232, 1),
                        filled: true,
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(25)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(25)))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(161, 198, 232, 1),
                      filled: true,
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25)),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot password?",
                          style: TextStyle(fontSize: 13)),
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(161, 198, 232, 1))),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              )),
        )
      ],
    );
  }
}
