import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureDialog {
  User? user;

  PictureDialog({this.user});

  // fonction pour visualiser la boite de dialog;

  void showPicDialog(BuildContext context, ImageSource source) async {
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pickedFile!.path);
    final _keyForm = GlobalKey<FormState>();
    String _picName = '';  
    String _formErreur = 'Veuillez founir le nom de l\'image';
      // ignore: use_build_context_synchronously
    showDialog(context: context, builder: (BuildContext contex){
      return SimpleDialog(
        contentPadding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey,
              image: DecorationImage(
                image: FileImage(_file),
                fit: BoxFit.cover,    
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Form(
                  key: _keyForm,
                  child: TextFormField(
                    maxLength: 100,
                    onChanged: (value) => _picName = value,
                    validator: (value) => _picName == null ? _formErreur : null,
                    decoration: const InputDecoration(
                      labelText: "Description de l'image",
                      border: OutlineInputBorder(),
                    ),
                  )
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      children: [
                        TextButton(
                          onPressed: ()=> Navigator.of(context).pop(),
                          child: Text('ANNULER')),
                          ElevatedButton(onPressed: (){},
                          child: Text('PUBLIER')),
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      );
    });
  }
}