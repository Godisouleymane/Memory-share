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

  // Recupereation de toutes les images en temps reel;

  Stream <List<Picture>> get pics {
    Query queryPictures = _pics.orderBy('picTimeStamp', descending: true);

    return queryPictures.snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        return Picture(
          picID: doc.id,
          picDesc: doc.get('picDesc'),
          picUrlImg: doc.get('picUrlImg'),
          picUserID: doc.get('picUserID'),
          picUserName: doc.get('picUserName'),
          picFavoriteCount: doc.get('picFavoriteCount'),
          picTimeStamp: doc.get('picTimeStamp')
        );
      }).toList();
    });
  }

  // ajout de la voiture faavorit dans la sous colleection;

  void addFavoritePicture(Picture picture, String userID) async {
    final picDocRef = _pics.doc(picture.picID);
    final favoritedBy = picDocRef.collection('favoritedBy');
    int picFavoriteCount = picture.picFavoriteCount!;
    int increaseCount = picFavoriteCount += 1;
    favoritedBy.doc(userID).set({
       "picDesc": picture.picDesc,
        "picUrlImg": picture.picUrlImg,
        "picUserID": picture.picUserID,
        "picUserName": picture.picUserName,
        "picTimeStamp": picture.picTimeStamp,
        "picFavoriteCount": increaseCount,
    });

    picDocRef.update({
       "picFavoriteCount": increaseCount,
    });
  }

  // Retirer la photo de la liste des favoris;

  void removeFavoritePicture(Picture picture, String userID) {
    final picDocRef = _pics.doc(picture.picID);
    final favoritedBy = picDocRef.collection('favoritedBy');
    int picFavoriteCount = picture.picFavoriteCount!;
    int decreaseCount = picFavoriteCount -= 1;

     picDocRef.update({
       "picFavoriteCount": decreaseCount,
    });
    favoritedBy.doc(userID).delete();
  }
}