import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/helpers/showsnackbarmessage.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/register/logic/cubit/auth_cubit.dart';
import 'package:online_auth_system/features/register/ui/widgets/already_have_an_account.dart';
import 'package:online_auth_system/features/register/ui/widgets/alterantive_accounts.dart';
import 'package:online_auth_system/features/register/ui/widgets/app_icon_and_register_text.dart';
import 'package:online_auth_system/features/register/ui/widgets/register_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  final String role;

  const RegisterScreen({
    super.key,
    required this.role,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> handleSignup(BuildContext context, User user) async {
    try {
      // Retrieve user data from Firestore
      DocumentSnapshot userData = await _firestoreService.getUser(user.uid);
      String role = userData['role'];

      if (role == 'Admin') {
        // Navigate to Admin Dashboard
        if (context.mounted) {
          context.pushReplacementNamed(
            Routes.adminDashboard,
            arguments: {'role': role, 'userId': user.uid},
          );
        }
      } else {
        // Navigate to User Dashboard
        if (context.mounted) {
          context.pushReplacementNamed(
            Routes.userDashboard,
            arguments: user.uid,
          );
        }
      }
    } catch (e) {
      showSnackBarMessage(context, 'Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupLoadingState) {
          setState(() {
            isLoading = true;
          });
        } else if (state is SignupSucessState) {
          setState(() {
            isLoading = false;
          });
          showSnackBarMessage(context, state.sucessMessage);
          // Handle navigation based on the role
          handleSignup(context, state.user);
        } else if (state is SignupFailureState) {
          setState(() {
            isLoading = false;
          });
          showSnackBarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        verticalSpace(44),
                        const AppIconAndRegisterText(),
                        verticalSpace(60),
                        Column(
                          children: [
                            RegisterForm(
                              role: widget.role,
                            ),
                            verticalSpace(30),
                            const Text("or register with"),
                            verticalSpace(20),
                            const AlterantiveAccounts(),
                            verticalSpace(20),
                            AlreadyHaveAnAccount(
                              role: widget.role,
                            ),
                            verticalSpace(60),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getUser(String uid) async {
    return await _firestore.collection('users').doc(uid).get();
  }
}
