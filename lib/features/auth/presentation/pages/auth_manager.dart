import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_butterfly/features/auth/presentation/pages/sign_in_page.dart';
import 'package:social_butterfly/features/auth/presentation/pages/sign_up_page.dart';
import 'package:social_butterfly/logger.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({super.key});

  @override
  State<AuthManager> createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Center(
            child: Text("asd"),
          );

          /// if the user is not authenticated navigate them to [SignInPage]
        } else {
          return const SignUpPage();
        }
      },
    );
  }
}
