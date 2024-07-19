import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/routing/app_router.dart';
import 'package:online_auth_system/firebase_options.dart';
import 'package:online_auth_system/online_auth_system_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    OnlineAuthSystem(
      appRouter: AppRouter(),
    ),
  );
}
