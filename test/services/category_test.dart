import 'dart:io';
import 'package:spectra/spectra.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_test/angel_test.dart';
import 'package:test/test.dart';

main() async {
  Angel app;
  TestClient client;

  setUp(() async {
    app = await createServer();
    client = await connectTo(app);
  });

  tearDown(() async {
    await client.close();
    app = null;
  });

  test('index via REST', () async {
    var response = await client.get('/api/categories');
    expect(response, hasStatus(HttpStatus.OK));
  });

  test('Index categorys', () async {
    var categories = await client.service('api/categories').index();
    print(categories);
  });
}