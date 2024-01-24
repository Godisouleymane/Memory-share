import 'package:cloud_firestore/cloud_firestore.dart';

class Picture {
  String? picID, picDesc, picUrlImg, picUserID, picUserName;

  Timestamp? picTimeStamp;
  bool? isMyFavoritePicture;
  int? picFavoriteCount;

  Picture({
    this.picID,
    this.picDesc,
    this.picUrlImg,
    this.picUserID,
    this.picUserName,
    this.picTimeStamp,
    this.isMyFavoritePicture,
    this.picFavoriteCount,
  });
}