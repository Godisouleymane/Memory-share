import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddPictureSection extends StatelessWidget {
  final User? user;
  const AddPictureSection({this.user});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text('Salut'),
            
                Text(user!.displayName!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
                )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300]
                      ),
                      child: IconButton(
                        onPressed: (){}, icon: Icon(Icons.search)),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300]
                      ),
                      child: IconButton(
                        onPressed: (){}, icon: Icon(Icons.add)),
                    )
                  ],
                )
              ],
            ),
          )
        ]
      )
      );
  }
}