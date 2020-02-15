import 'package:chatapp/ui/widgets/errorbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/model/userdata.dart';



class Auth {
  ///Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //!Firebase Firestore instance
  final Firestore _db = Firestore.instance;

  //Login State
  Future<FirebaseUser> loginState()async{

    return await _auth.currentUser();
  }
  //!Get email
  Future<String> getEmail()async{
    String _email;
    await _auth.currentUser().then((result){
      _email =  result.email;
    });
    print("Db email  = $_email");
    return _email;
  }
  //!Firebase Login
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

  //!Firebase Create Account
  Future<AuthResult> signup(context,User data) async{
    print("enter");

    try {
        AuthResult _result =  await _auth.createUserWithEmailAndPassword(email: data.email, password: data.pwd).whenComplete(()async{
          //!Add user infomation
           await _db.collection("users").add({
            'name':data.name,
            'email':data.email,
            'about':data.about,
            'profile':data.profile
          }).catchError((e){
            print(e);
          });
           await _db.collection("contacts").add({
             'name':data.name,
             'email':data.email,
             'profile':data.profile
           }).catchError((e){
             print(e);
           });
          //!Add user to contact list
          print("sucees..");
      });
      await _result.user.sendEmailVerification();
      return _result;
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


  //Login with google

}

Auth authApi = Auth();
