import 'package:angel_framework/angel_framework.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../models/category.dart';
import 'permissions.dart';
export '../models/category.dart';

configureServer(Db db) {
  return (Angel app) async {
    app.use(
        '/api/categories', new CategoryService(db.collection('categories')));

    HookedService service = app.service('api/categories');
    app.container.singleton(service.inner);

    service
      ..beforeCreated.listen(AUTHORS_ONLY.toHook())
      ..beforeModified.listen(AUTHORS_ONLY.toHook())
      ..beforeUpdated.listen(AUTHORS_ONLY.toHook())
      ..beforeRemoved.listen(AUTHORS_ONLY.toHook());
  };
}

/// Manages [Category] in the database.
class CategoryService extends MongoTypedService<Category> {
  CategoryService(collection) : super(collection) {
    // Your logic here!
  }
}
