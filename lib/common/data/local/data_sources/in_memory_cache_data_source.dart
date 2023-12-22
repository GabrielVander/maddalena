import 'package:rust_core/result.dart';

abstract interface class InMemoryCacheDataSource<T> {
  Future<Result<void, String>> cache(String key, T data);

  Future<Result<T, String>> fetch(String key);

  Future<Result<T, String>> delete(String key);

  Future<Result<void, String>> clearAll();
}

class InMemoryCacheDataSourceImpl<T> implements InMemoryCacheDataSource<T> {
  final Map<String, T> _cache = {};

  @override
  Future<Result<void, String>> cache(String key, T data) {
    if (_cache.containsKey(key)) {
      return Err<void, String>('$key is already cached').toFutureResult();
    }

    _cache[key] = data;

    return const Ok<void, String>(null).toFutureResult();
  }

  @override
  Future<Result<T, String>> fetch(String key) {
    if (!_cache.containsKey(key)) {
      return Err<T, String>('$key is not cached').toFutureResult();
    }

    return Ok<T, String>(_cache[key] as T).toFutureResult();
  }

  @override
  Future<Result<T, String>> delete(String key) {
    if (!_cache.containsKey(key)) {
      return Err<T, String>('Key $key does not exist').toFutureResult();
    }

    final removedValue = _cache.remove(key);

    return Ok<T, String>(removedValue as T).toFutureResult();
  }

  @override
  Future<Result<void, String>> clearAll() {
    _cache.clear();

    return const Ok<void, String>(null).toFutureResult();
  }
}
