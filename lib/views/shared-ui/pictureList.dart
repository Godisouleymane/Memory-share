import 'package:flutter/material.dart';
import 'package:memory_share/model/picModel.dart';
import 'package:memory_share/services/dbService.dart';
import 'package:memory_share/views/shared-ui/pictureFeeed.dart';
import 'package:provider/provider.dart';

class PictureList extends StatelessWidget {
  final String? pageName, userID; 
  const PictureList({this.pageName,this.userID});

  @override
  Widget build(BuildContext context) {
    final _photos = Provider.of<List<Picture>>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate((_, index){
        return StreamBuilder(stream:
        DataBaseService(userID: userID, picID: _photos[index].picID).myFavoritePicture,
        builder: (context, snapshot){
          if (!snapshot.hasData) {
            _photos[index].isMyFavoritePicture = false;
            return PictureFeed(
              picture: _photos[index], userID: userID,
            );
          } else {
              _photos[index].isMyFavoritePicture = true;
            return PictureFeed(
              picture: _photos[index], userID: userID, 
            );
          }
        }
        );
      },
      childCount: _photos.length
      )
      );
  }
}