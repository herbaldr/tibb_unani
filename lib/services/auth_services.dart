import 'package:tibb_unani/views/auth_screens/sign_in_screen.dart';

import '../models/user_model.dart' as u;
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService{
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  u.User? _userFromFirebase(auth.User? user){
    if (user == null){
      return null;
    }
    return u.User(user.uid,user.email!);
  }

  // getting user information...
  Stream<u.User?>? get user{
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  // Signing in register user to the app...
  Future<u.User?> signInWithEmailAndPassword(
      String email,
      String password
      ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    return _userFromFirebase(credential.user);
  }

  // Registering & Creating new user in the app...
  Future<u.User?> createUserWithEmailAndPassword(
      String email,
      String password
      ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return _userFromFirebase(credential.user);
  }

  // Sign_out method for log_out user from the app...
  Future<void> signOut () async{
    return await _firebaseAuth.signOut();
  }
}