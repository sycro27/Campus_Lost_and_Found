import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'mock_firebase_services.dart';

void main() {
  late MockFirebaseFirestore mockFirestore;
  late MockDocumentReference mockDocRef;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockDocRef = MockDocumentReference();
  });

  test('Add new item to Firestore', () async {
    // Mock Firestore collection
    final mockCollection = MockCollectionReference();
    when(mockFirestore.collection('lost_items')).thenReturn(mockCollection);

    // Mock Firestore document add
    when(mockCollection.add(any)).thenAnswer((_) async => mockDocRef);

    final itemData = {
      'item_name': 'Lost Wallet',
      'timestamp': FieldValue.serverTimestamp(),
      'user_email': 'test@example.com',
      'category': 'wallet',
    };

    final docRef = await mockFirestore.collection('lost_items').add(itemData);

    expect(docRef, mockDocRef);
  });

  test('Delete item from Firestore', () async {
    // Mock Firestore document delete
    when(mockDocRef.delete()).thenAnswer((_) async => {});

    await mockDocRef.delete();

    verify(mockDocRef.delete()).called(1);
  });
}
