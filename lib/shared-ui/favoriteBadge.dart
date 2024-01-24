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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7)
      ),
    );
  }
}