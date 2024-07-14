import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../constants/enums/firebase_keys_enum.dart';

abstract class FireBaseConnection {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => firebaseAuth.currentUser;
  final FirebaseStorage storage = FirebaseStorage.instance;

  /// UID of current user
  String? get uid => firebaseAuth.currentUser?.uid;

  CollectionReference<Map<String, dynamic>> postsCollection() {
    return firestore.collection(FirebaseKeysEnum.Posts.name);
  }
}
