import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_share/model/picModel.dart';
import 'package:memory_share/services/dbService.dart';
import 'package:memory_share/views/shared-ui/showSnackBar.dart';

class PictureDialog {
  User? user;

  PictureDialog({this.user});

  // fonction pour visualiser la boite de dialog;

  void showPicDialog(BuildContext context, ImageSource source) async {
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pickedFile!.path);
    final _keyForm = GlobalKey<FormState>();
    String _picDesc = '';  
    String _formErreur = "Veuillez founir la description de l'image";
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
                    onChanged: (value) => _picDesc = value,
                    validator: (value) => _picDesc.isEmpty ? _formErreur : null,
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
                          child: const Text('ANNULER')),
                          ElevatedButton(onPressed: ()=> onSubmit(context, _keyForm, _file, _picDesc, user),
                          child: const Text('PUBLIER')),
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

  void onSubmit(context, keyForm, file, picDesc, user) async {
    if (keyForm.currentState!.validate()) {
      Navigator.of(context).pop();
      showNotification(context, "Chargement...");
      DataBaseService db = DataBaseService();

      String _picUrlImg = await db.uploadFile(file);

      db.addPic(Picture(
        picDesc: picDesc,
        picUrlImg: _picUrlImg,
        picUserID: user!.uid,
        picUserName: user!.displayName,
      ));
    }
  }
}