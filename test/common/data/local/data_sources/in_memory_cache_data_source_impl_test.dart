import 'package:flutter_test/flutter_test.dart';
import 'package:maddalena/common/data/local/data_sources/in_memory_cache_data_source.dart';
import 'package:rust_core/src/result/result.dart';

void main() {
  late InMemoryCacheDataSourceImpl<String> dataSource;

  setUp(() {
    dataSource = InMemoryCacheDataSourceImpl<String>();
  });

  group('cache', () {
    test('should return Ok when caching is successful', () async {
      const key = 'MarcosMustafa';
      const data = 'sDstcKWj';

      final result = await dataSource.cache(key, data);

      expect(result, const Ok<void, String>(null));
    });

    test('should return Err when caching an already cached key', () async {
      const key = 'AliXu';

      await dataSource.cache(key, 'PRAjN8cO');
      final result = await dataSource.cache(key, 'B2hm81MQO');

      expect(result, const Err<void, String>('$key is already cached'));
    });
  });

  group('fetch', () {
    test('should return Err when attempting to fetch a non-existent key', () async {
      const key = 'Jindo Nascimento';

      final result = await dataSource.fetch(key);

      expect(result, const Err<void, String>('$key is not cached'));
    });

    test('should return Ok when fetching cached value', () async {
      const key = 'MarcosHossain';
      const value = 'EgDoVNZ';

      await dataSource.cache(key, value);
      final result = await dataSource.fetch(key);

      expect(result, const Ok<String, String>(value));
    });
  });

  group('delete', () {
    test('should return Err when attempting to delete a non-existent key', () async {
      const key = 'DinaQian';

      final result = await dataSource.delete(key);

      expect(result, const Err<void, String>('Key $key does not exist'));
    });

    test('should return Ok when deletion is successful', () async {
      const key = 'ArunMia';
      const value = 'CgooSvnME1o';

      await dataSource.cache(key, value);
      final result = await dataSource.delete(key);

      expect(result, const Ok<String, String>(value));
    });
  });

  group('clearAll', () {
    test('should return Ok when cache is empty', () async {
      final result = await dataSource.clearAll();

      expect(result, const Ok<void, String>(null));
    });

    test('should return Ok when cache is not empty', () async {
      await dataSource.cache('XiaohongZhu', '4afhaNPtl00');
      await dataSource.cache('DeborahMachado', '9xX5SrER5S');
      await dataSource.cache('MariamNayak', 'XLnFn8t');
      final result = await dataSource.clearAll();

      expect(result, const Ok<void, String>(null));

      for (final key in ['XiaohongZhu', 'DeborahMachado', 'MariamNayak']) {
        final result = await dataSource.fetch(key);

        expect(result, Err<void, String>('$key is not cached'));
      }
    });
  });
}
