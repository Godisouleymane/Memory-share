import 'package:flutter/material.dart';
import 'package:memory_share/model/picModel.dart';

class FavoriteBadge extends StatefulWidget {
  final Picture? picture;
  final String? userID;
  const FavoriteBadge({this.picture, this.userID});

  @override
  State<FavoriteBadge> createState() => _FavoriteBadgeState();
}

class _FavoriteBadgeState extends State<FavoriteBadge> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4.0,
      right: 12.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white.withOpacity(0.3)
        ),
        child: widget.picture!.isMyFavoritePicture! ? Row(
          children: [
            Text('${widget.picture!.picFavoriteCount}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            ),
            const Icon(
              Icons.favorite, color: Colors.red,
            )
          ],
        ) : Row(
          children: [
            widget.picture!.picFavoriteCount! > 0 ?
            Text('${widget.picture!.picFavoriteCount}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            ) : Container(),
            const Icon(
              Icons.favorite,
            )
          ],
        ),
      ),
    );
  }
}