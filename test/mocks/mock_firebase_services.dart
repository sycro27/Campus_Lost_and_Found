import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Mock FirebaseAuth
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Mock User
class MockUser extends Mock implements User {}

// Mock Firebase Firestore
class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

// Mock Firebase Firestore DocumentReference
class MockDocumentReference extends Mock implements DocumentReference {}

// Mock Firebase Storage
class MockFirebaseStorage extends Mock implements FirebaseStorage {}

// Mock Firebase Storage Reference
class MockStorageReference extends Mock implements Reference {}
