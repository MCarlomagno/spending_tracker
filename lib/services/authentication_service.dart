import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => this._firebaseAuth.currentUser != null;

  User? get currentUser => this._firebaseAuth.currentUser;

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user != null;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future signUpWithEmail({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authResult.user != null) {
        await authResult.user!.updateDisplayName(name);
      }

      return authResult.user != null;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future logOut() async {
    try {
      return _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future updateName({required String? name}) async {
    await currentUser!.updateDisplayName(name);
  }
}
