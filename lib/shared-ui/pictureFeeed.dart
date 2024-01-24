import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:memory_share/model/picModel.dart';


class PictureFeed extends StatelessWidget {
  final Picture? picture;
  final String? userID;
  const PictureFeed({this.picture, this.userID});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
      height: MediaQuery.of(context).size.height * 0.35,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
     decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      image: DecorationImage(
        image: NetworkImage(picture!.picUrlImg!),
        fit: BoxFit.cover
        )
     ),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
            picture!.picDesc!,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),

          Text(
           'De ${picture!.picUserName}'
          )
          ],
         ),
         Text(formattingDate(picture!.picTimeStamp))
        ],
      ),
    )
      ],
    );
  }

  String formattingDate(Timestamp? timestamp) {
    initializeDateFormatting('fr', null);
    DateTime? dateTime = timestamp?.toDate();
    DateFormat? dateFormat = DateFormat.MMMd('fr');
    return dateFormat.format(dateTime ?? DateTime.now());
  }
}