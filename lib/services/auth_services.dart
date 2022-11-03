import '../models/user_model.dart' as u;
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService{
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  u.User? _userFromFirebase(auth.User? user){
    if (user == null){
      return null;
    }
    return u.User(userId: user.uid,email: user.email!);
  }
  Stream<u.User?>? get user{
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }
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
  Future<void> signOut () async{
    return await _firebaseAuth.signOut();
  }
}