import 'package:flutter/material.dart';
import 'package:memory_share/model/picModel.dart';
import 'package:memory_share/shared-ui/pictureFeeed.dart';
import 'package:provider/provider.dart';

class PictureList extends StatelessWidget {
  final String? userID; 
  const PictureList({this.userID});

  @override
  Widget build(BuildContext context) {
    final _photos = Provider.of<List<Picture>>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate((_, index){
        return PictureFeed(picture: _photos[index],
         userID: userID,
         );
      },
      childCount: _photos.length
      )
      );
  }
}