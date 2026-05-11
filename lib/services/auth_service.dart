import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  
  Future<UserCredential?> login() async{
    try{
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      
      // Authenticate with Google using authenticate() method
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
      
      if(googleUser == null){
        return null;
      }
      
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if(googleAuth.idToken == null){
        return null;
      }
      
      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){
      print('Sign in error: $e');
      return null;
    }
  }


}
