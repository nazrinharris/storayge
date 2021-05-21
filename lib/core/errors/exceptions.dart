class FirestoreException implements Exception {
  final String message;

  FirestoreException(this.message);
}

class CacheException implements Exception {}

class AppException implements Exception {}
