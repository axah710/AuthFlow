import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final String role;
  AuthCubit({required this.role}) : super(AuthInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // String? userUid;
  User? user;
  // Sign up with email and password
  Future<User?> registerWithEmail(String email, String password) async {
    emit(SignupLoadingState());
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = result.user;

      if (user != null) {
        await _firestore.collection('users').doc(user!.uid).set({
          'email': email,
          'role': role,
        });
        emit(
          SignupSucessState(
            user: result.user!,
            sucessMessage: 'The account has been created successfully.',
            role: role,
          ),
        );
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          SignupFailureState(
              errorMessage: "The password provided is too weak."),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignupFailureState(
              errorMessage: "The account already exists for that email."),
        );
      } else {
        emit(
          SignupFailureState(errorMessage: "Oops there was an error."),
        );
      }
    }
    return null;
  }

  // Sign in with email and password
  Future<User?> signInWithEmail(String email, String password) async {
    emit(LoginLoadingState());
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      emit(
        LoginSucessState(
          role: role,
          user: result.user!.uid,
        ),
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(
          LoginFailureState(errorMessage: 'No user found for that email.'),
        );
      } else if (e.code == 'wrong-password') {
        emit(
          LoginFailureState(
              errorMessage: 'Wrong password provided for that user.'),
        );
      } else {
        emit(
          LoginFailureState(errorMessage: 'Oops There Was An Error'),
        );
      }
    }
    return user;
  }

  // Sign out
  Future<void> signOut() async {
    emit(SignoutLoadingState());
    try {
      await FirebaseAuth.instance.signOut();
      emit(
        SignoutSucessState(sucessMessage: 'Signed out successfully.'),
      );
    } on Exception {
      emit(
        SignoutFailureState(errorMessage: "Oops there was an error."),
      );
    }
  }
}
