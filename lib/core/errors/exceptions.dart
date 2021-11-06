class CacheException implements Exception {}

class AppException implements Exception {}

class UserNotFoundException implements Exception {}

class CodeException implements Exception {
  final String code;
  final String message;

  CodeException({
    required this.code,
    required this.message,
  });
}

class StorageException implements CodeException {
  @override
  final String code;
  @override
  final String message;

  StorageException({required this.code, required this.message});
}

class UnexpectedException implements CodeException {
  @override
  final String code;
  @override
  final String message;

  UnexpectedException({required this.code, required this.message});
}
