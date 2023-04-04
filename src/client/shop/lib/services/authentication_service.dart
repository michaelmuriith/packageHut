import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../app/app.locator.dart';
import 'firestore_service.dart';
import '../models/user.dart';

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  late User _currentUser;
  User get currentUser => _currentUser;

  Future<bool> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(userCredential.user);
      return userCredential.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    required String imageUrl, 
    required String fullName,
  }) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = User(
        id: userCredential.user!.uid,
        fullName: fullName,
        imageUrl: imageUrl,
        email: email,
        password: password,
      );

      await _firestoreService.createUser(_currentUser);

      return userCredential.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(auth.User? user) async {
    if (user != null) {
      _currentUser = (await _firestoreService.getUser(user.uid))!;
    }
  }
}
