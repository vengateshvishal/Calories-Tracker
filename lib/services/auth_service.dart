import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn.instance;

  Future<bool> signInWithGoogle() async{
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
      if(googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);
      return true;
    }catch(e){
      return false;
    }
  }
}
