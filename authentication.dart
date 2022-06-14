import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  FirebaseAuth _firebaseAuth;

  Authentication(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }

  Future<String?> signIn({required String email, required String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      // await FirebaseAuth.instance.currentUser.updateProfile(displayName: name);
      return "Signed in";
    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }

  Future<String?> signUp({required String email, required String password, required String name}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateProfile(displayName: name);
      signOut();
      return "Signed up";
    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }


}
