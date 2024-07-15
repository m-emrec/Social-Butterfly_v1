import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../data/datasources/auth_injection_container.dart';
import 'sign_in_page.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({super.key});

  @override
  State<AuthManager> createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  @override
  void initState() {
    super.initState();
    AuthInjectionContainer().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        /// If user authenticated return [HomePage]
        if (snapshot.hasData) {
          return const HomePage();

          /// if the user is not authenticated navigate them to [SignInPage]
        } else {
          return const SignInPage();
        }
      },
    );
  }
}
