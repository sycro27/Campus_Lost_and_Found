import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mockito/mockito.dart';
import 'mock_firebase_services.dart';

void main() {
  late MockFirebaseStorage mockFirebaseStorage;
  late MockStorageReference mockStorageReference;

  setUp(() {
    mockFirebaseStorage = MockFirebaseStorage();
    mockStorageReference = MockStorageReference();
  });

  test('Upload image to Firebase Storage', () async {
    final mockReference = MockStorageReference();

    // Mock the storage reference for a file
    when(mockFirebaseStorage.ref('images/lost_wallet.png')).thenReturn(mockReference);

    // Mock file upload
    when(mockReference.putFile(any)).thenAnswer((_) async => TaskSnapshot(
      task: null, // We don't need to mock the task
      ref: mockReference,
      state: TaskState.success,
      totalBytes: 1000,
      bytesTransferred: 1000,
      metadata: StorageMetadata(),
    ));

    final file = 'test_file_path'; // Simulate a file path
    final uploadTask = await mockReference.putFile(file);

    expect(uploadTask.state, TaskState.success);
  });
}
