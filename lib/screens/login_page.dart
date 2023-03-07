import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:govapp/base_client.dart';
import 'package:govapp/screens/ListOfTransactions.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final LocalStorage storage = LocalStorage('localstorage_app');

  void navigatePage(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return ListOfTransactions();
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (storage.getItem("token") != null) {
      navigatePage(context);
    }
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            // ignore: prefer_const_literals_to_create_immutables
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 35),

              Text(
                "Hello Again!",
                style: GoogleFonts.bebasNeue(fontSize: 52),
              ),

              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _email,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),

              // !Password Field
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () async {
                      var uri = Uri.parse(
                          'http://localhost:8080/api/v1/admin/auth/login');

                      Map<String, dynamic> data = {
                        'email': _email.text,
                        'password': _password.text,
                      };

                      String jsonData = jsonEncode(data);

                      Response res = await http.post(uri,
                          body: jsonData,
                          headers: {'Content-Type': 'application/json'});
                      Map<String, dynamic> responseBody = jsonDecode(res.body);

                      storage.setItem("token", responseBody['token']);
                      print(responseBody['token']);

                      if (storage.getItem("token") != null) {
                        navigatePage(context);
                      }
                    },
                    child: const Text('Sign in'),
                  )),
                ),
              )
            ],
          ),
        )));
  }
}
