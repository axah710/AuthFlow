import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_auth_system/core/helpers/showsnackbarmessage.dart';

class FirestoreService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

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
  // Delete user from Firestore and Firebase Authentication
  Future<void> deleteUser(String uid , context) async {
    try {
      // Delete from Firestore
      await usersCollection.doc(uid).delete();

      // Delete from Firebase Authentication
      User? user = await FirebaseAuth.instance
          .authStateChanges()
          .firstWhere((user) => user!.uid == uid);
      await user!.delete();
    } catch (e) {
      showSnackBarMessage(context, "Failed to delete user");
    }
  }
}
