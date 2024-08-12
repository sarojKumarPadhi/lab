import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

mixin DataBaseConfig {
  final auth = FirebaseAuth.instance;
  final firstore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'development', // For Developement
    // databaseId: 'default',   // For Live
  );
  final rtDatabase = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://zonk-fbbb1-development-rtdb.firebaseio.com/' // For Development
      // databaseURL: 'https://zonk-fbbb1-default-rtdb.firebaseio.com/'  // For Live

      );
}
