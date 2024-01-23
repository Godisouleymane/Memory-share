import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:memory_share/model/picModel.dart';

class DataBaseService {
  // declaration et initialisation

  CollectionReference _pics = FirebaseFirestore.instance.collection('pics');
  FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload l'image vers firebase Storage;

  Future<String> uploadFile(file) async{
    Reference reference = _storage.ref().child('pics/${DateTime.now()}.png');
    UploadTask uploadTask = reference.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  // Ajout de l'image dans la base de donnee;

  void addPic(Picture picture){
    _pics.add(
      {
        "picDesc": picture.picDesc,
        "picUrlImg": picture.picUrlImg,
        "picUserID": picture.picUserID,
        "picUserName": picture.picUserName,
        "picTimeStamp": FieldValue.serverTimestamp(),
        "picFavoriteCount": 0,
      }
    );
  }
}