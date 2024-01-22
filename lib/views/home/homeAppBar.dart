import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final User? user;
  const HomeAppBar({this.user});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Mem-Share'),
      elevation: 0.8,
      floating: true,
      forceElevated: true,
      actions: [
       Padding(
         padding: const EdgeInsets.only(right: 8.0),
         child: GestureDetector(
          onTap: ()=> Navigator.pushNamed(context, '/profile'),
           child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(user!.photoURL!),
           ),
         ),
       )
      ],
    );
  }
}