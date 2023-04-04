import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future createUser(User user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toJson());
    } catch (e) {
      return e.toString();
    }
  }

  Future<User?> getUser(String userId) async {
    try {
      var userData = await _firestore.collection('users').doc(userId).get();
      return User.fromData(userData.data()!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
