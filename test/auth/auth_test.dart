import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'mock_firebase_services.dart'; // Import the mock classes

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();
  });

  test('Sign in successfully', () async {
    // Mock the sign-in method
    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: 'test@example.com',
      password: 'password123',
    )).thenAnswer((_) async => UserCredential(
      additionalUserInfo: null,
      user: mockUser,
    ));

    final userCredential = await mockFirebaseAuth.signInWithEmailAndPassword(
      email: 'test@example.com',
      password: 'password123',
    );

    expect(userCredential.user, mockUser);
  });

  test('Sign up successfully', () async {
    // Mock the createUserWithEmailAndPassword method
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
      email: 'newuser@example.com',
      password: 'password123',
    )).thenAnswer((_) async => UserCredential(
      additionalUserInfo: null,
      user: mockUser,
    ));

    final userCredential = await mockFirebaseAuth.createUserWithEmailAndPassword(
      email: 'newuser@example.com',
      password: 'password123',
    );

    expect(userCredential.user, mockUser);
  });
}
