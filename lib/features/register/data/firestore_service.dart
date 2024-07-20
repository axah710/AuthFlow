import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  // Create a new user document
  Future<void> createUser(String uid, String email, String role) async {
    return await usersCollection.doc(uid).set({
      'email': email,
      'role': role,
    });
  }

  // Retrieve user data
  Future<DocumentSnapshot> getUser(String uid) async {
    return await usersCollection.doc(uid).get();
  }

  // Update user data
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    return await usersCollection.doc(uid).update(data);
  }

  // Delete user
  Future<void> deleteUser(String uid) async {
    return await usersCollection.doc(uid).delete();
  }
}
