import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memory_share/services/authentification.dart';

class ProfilAppBar extends StatelessWidget {
  final User? user;
  const ProfilAppBar({this.user});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
    expandedHeight:MediaQuery.of(context).size.height * 0.40,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(user!.photoURL!), ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.transparent],
              begin: Alignment.bottomRight
              )
          ),
        ),
      ),
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '${user!.displayName}\n',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: '${user!.email}',
              style:
               Theme.of(context).textTheme.caption?.copyWith(
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ]
        )
        ),
    ),
    actions: [
      IconButton(
        onPressed: () => signOut(context), 
        icon: Icon(Icons.logout))
    ],
    );
  }

  signOut(BuildContext context){
    Navigator.of(context).pop();
    AuthService().signOut();
  }

}
