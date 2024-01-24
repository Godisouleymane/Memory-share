import 'package:flutter/material.dart';
import 'package:memory_share/model/picModel.dart';

class PictureFeed extends StatelessWidget {
  final Picture? picture;
  final String? userID;
  const PictureFeed({this.picture, this.userID});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
     decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(picture!.picUrlImg!),
        fit: BoxFit.cover
        )
     ),
    );
  }
}