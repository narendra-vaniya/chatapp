import 'package:chatapp/api/auth.dart';
import 'package:chatapp/model/userdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Database extends ChangeNotifier {
  //!Firebase Firestore database
  final _db = Firestore.instance;
  final _storage = FirebaseStorage.instance.ref();

  

  FirebaseUser _user;
  Stream<QuerySnapshot> _listOfContacts;
  Stream<QuerySnapshot> get userdata => _listOfContacts;

  //!Get current user data
  Stream<QuerySnapshot> getCurrentUserData() async* {
    _user = await authApi.loginState();
    print(_user.email);
    yield* _db
        .collection("users")
        .orderBy('email', descending: false)
        .where('email', isEqualTo: _user.email)
        .snapshots();
  }

  //!Update Current user data
  void updateUserData(id, User data, file, context) async {
    String _profilePath;
    if (file == null) {
      _db.collection("users").document(id).updateData({
        'name': data.name.trim(),
        'about': data.about.trim(),
      }).then((user) {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } else {
      StorageUploadTask _task =
          _storage.child(data.profile.split('/').last + "\b").putFile(file);

      await _task.onComplete.then((data) async {
        _profilePath = await data.ref.getDownloadURL();
      });

      _db.collection("users").document(id).updateData({
        'name': data.name.trim(),
        'about': data.about.trim(),
        'profile': _profilePath
      }).then((user) {
        Navigator.pushNamedAndRemoveUntil(context,'/MainPage',(Route r)=>false);
      });
    }
  }

  //!Get all contact list
  List<DocumentSnapshot> getAllContactList() {
    List<DocumentSnapshot> allUserChat = [];
    _db.collection("users").snapshots().forEach((alluser) {
      allUserChat.clear();
      alluser.documents.forEach((u) {
        (u['email'] != "nkahir@gmail.com") ? allUserChat.add(u) : null;
        notifyListeners();
      });
      return allUserChat;
      
    });
  }

  //!get all chat
  Stream<QuerySnapshot> getAllChat(id){
    return _db.collection("room$id").orderBy('time',descending: false).snapshots();
  }
  
  //!Room chat
  sendMsgToRoom(id,String msg,String time,String sendername){
    _db.collection("room$id").add({
      'message':msg,
      'senderemail':sendername,
      'time':time
    });
  }

}

//!Object
Database DB = new Database();
