abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? document,
  });
  Future<dynamic> fetchData({required String path, required String document});
  Future<void> updateData({
    required String path,
    required String document,
    Map<String, dynamic>? data,
  });
}
