import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:memory_share/model/picModel.dart';

class PictureDetail extends StatelessWidget {
  const PictureDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final pubImage  = ModalRoute.of(context)!.settings.arguments as Picture;
    final _userID = Provider.of<User?>(context)!.uid;
    return 
    Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          pubImage.picDesc!,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light
        ),
        actions: [
          pubImage.picUserID == _userID ? 
          IconButton(onPressed: (){}, icon: Icon(Icons.delete)) : Container()
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: NetworkImage(pubImage.picUrlImg!)
          ),
        ),
      ),
    ));
  }
}