import 'dart:io';

import 'package:movie_app/core/constants/supabase_key.dart';
import 'package:movie_app/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService extends StorageService {
  static late Supabase _supabase;
  static Future<void> inital() async {
    _supabase = await Supabase.initialize(
      url: SupabaseKey.supabaseUrl,
      anonKey: SupabaseKey.supabaseKey,
    );
  }

  static Future<void> createBucket({required String bucketName}) async {
    bool isCreated = false;
    var list = await _supabase.client.storage.listBuckets();
    for (var bucket in list) {
      if (bucket.name == bucketName) {
        isCreated = true;
        break;
      }
    }
    if (!isCreated) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    var baseName = b.basename(file.path);
    var extension = b.extension(file.path);
    await _supabase.client.storage
        .from('images')
        .upload('$path/$baseName.$extension', file);
    var url = _supabase.client.storage
        .from('images')
        .getPublicUrl('$path/$baseName.$extension');
    return url;
  }
}
