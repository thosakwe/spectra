import 'package:angel_framework/angel_framework.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:angel_security/angel_security.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../models/category.dart';
export '../models/category.dart';

final PermissionBuilder _admin = new PermissionBuilder('admin');
final Permission _authorsOnly =
    new PermissionBuilder('author').or(_admin).toPermission();

configureServer(Db db) {
  return (Angel app) async {
    app.use(
        '/api/categories', new CategoryService(db.collection('categories')));

    HookedService service = app.service('api/categories');
    app.container.singleton(service.inner);

    service
      ..beforeIndexed.listen(_authorsOnly.toHook())
      ..beforeCreated.listen(_authorsOnly.toHook())
      ..beforeModified.listen(_authorsOnly.toHook())
      ..beforeUpdated.listen(_authorsOnly.toHook())
      ..beforeRemoved.listen(_authorsOnly.toHook());
  };
}

/// Manages [Category] in the database.
class CategoryService extends MongoTypedService<Category> {
  CategoryService(collection) : super(collection) {
    // Your logic here!
  }
}
