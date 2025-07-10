import 'package:movie_app/core/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase extends DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? document,
  }) async {
    if (document != null) {
      await firestore.collection(path).doc(document).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future fetchData({required String path, required String document}) async {
    var data = await firestore.collection(path).doc(document).get();

    return data.data();
  }

  @override
  Future<void> updateData({
    required String path,
    required String document,
    Map<String, dynamic>? data,
  }) async {
    await firestore.collection(path).doc(document).update(data!);
  }
}
