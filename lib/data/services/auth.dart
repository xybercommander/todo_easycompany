import 'package:firebase_auth/firebase_auth.dart';

class UserProfile {
  String? userId;
  UserProfile({this.userId});
}

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserProfile? _userFromFirebaseUser(User user) {    
    return UserProfile(userId: user.uid);
  }

  //--------- SIGN UP ---------//  
  Future<UserProfile?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

   //--------- SIGN IN ---------//
  Future<UserProfile?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  //------- SIGN OUT -------//
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}