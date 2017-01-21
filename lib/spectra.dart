import 'dart:async';
import 'dart:io';
import 'package:angel_common/angel_common.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'src/services/category.dart' as CategoryService;
import 'src/services/post.dart' as PostService;
import 'src/services/user.dart' as UserService;

Future<Angel> createServer() async {
  var app = new Angel();
  Db db;
  await app.configure(loadConfigurationFile());

  db = new Db(app.mongo_db);
  await db.open();
  await app.configure(CategoryService.configureServer(db));
  await app.configure(PostService.configureServer(db));
  await app.configure(UserService.configureServer(db));

  await app.configure(logRequests(new File('log.txt')));
  return app;
}
