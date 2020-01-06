import 'package:chatapp/ui/widgets/errorbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/model/userdata.dart';



class Auth {
  ///Firebase Auth instance
  FirebaseAuth _auth = FirebaseAuth.instance;
  //!Firebase Firestore instance
  Firestore _db = Firestore.instance;

  //Login State
  Future<FirebaseUser> loginState()async{
    return await _auth.currentUser();
  }

  //Firebase Login
  Future<AuthResult> signin(context, e, p) async {
    print("Enter");
    try {
      return await _auth.signInWithEmailAndPassword(email: e, password: p);
    } catch (e) {
      print(e.code);
      switch(e.code){
        case 'ERROR_WRONG_PASSWORD' :
            showError(context, "Wrong password.");
            break;
        case 'ERROR_USER_NOT_FOUND' :
          showError(context, "User not found.");
          break;
        case 'ERROR_INVALID_EMAIL' :
          showError(context, "Enter valid email.");
          break;
        default:
          showError(context,"Someing went to wrong.");
          break;
      }
    }
  }

  //Firebase Create Account
  Future<AuthResult> signup(context,User data) async{
    print("enter");
    try {
      return await _auth.createUserWithEmailAndPassword(email: data.email, password: data.pwd).whenComplete(()async{

          await _db.collection("users").add({
            'name':data.name,
            'email':data.email,
            'about':data.about,
            'profile':data.profile
          }).catchError((e){
            print(e);
          });

          print("sucees..");
      });
    } catch (e) {
      print(e.code);
      switch(e.code){
        case 'ERROR_WEAK_PASSWORD' :
          showError(context, "Your password must have 6 characters.");
          break;
        case 'ERROR_USER_NOT_FOUND' :
          showError(context, "User not found.");
          break;
        case 'ERROR_INVALID_EMAIL' :
          showError(context, "Enter valid email.");
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE' :
          showError(context, "Email is already used.");
          break;
        default:
          showError(context,"${e.code}");
          break;
      }
    }
  }
}

Auth authApi = Auth();
