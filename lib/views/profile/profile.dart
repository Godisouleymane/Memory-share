import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memory_share/views/profile/profileAppBar.dart';
import 'package:memory_share/views/shared-ui/pictureList.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
     final _user = Provider.of<User?>(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ProfilAppBar(
              user: _user,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const Padding(
                  padding: EdgeInsets.only(top: 24.0, left: 16.0, bottom: 12.0),
                  child: Text('Vos images favoris', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Divider()
              ])
              ),
              PictureList(pageName: 'Profile', userID: _user!.uid,)
          ],
        )
      ),
    );
  }
}