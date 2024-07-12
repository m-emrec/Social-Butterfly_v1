import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_butterfly/features/auth/data/datasources/auth_injection_container.dart';
import 'package:social_butterfly/features/auth/presentation/pages/sign_in_page.dart';

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
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () => FirebaseAuth.instance.signOut(),
            child: const Center(
              child: Text("asd"),
            ),
          );

          /// if the user is not authenticated navigate them to [SignInPage]
        } else {
          return const SignInPage();
        }
      },
    );
  }
}
