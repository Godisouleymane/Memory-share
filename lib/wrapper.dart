import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memory_share/views/home/home.dart';
import 'package:memory_share/views/login.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    if (_user == null) {
      return const Login();
    } else {
      return const Home();
    }
  }
}