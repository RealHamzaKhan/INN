import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

 final firestore=FirebaseFirestore.instance;
 final String usersCollection='users';
 final user=FirebaseAuth.instance.currentUser;