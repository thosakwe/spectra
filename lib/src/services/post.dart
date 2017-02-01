import 'package:angel_framework/angel_framework.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:angel_relations/angel_relations.dart' as relations;
import 'package:mongo_dart/mongo_dart.dart';
import '../models/post.dart';
import 'permissions.dart';
export '../models/post.dart';

configureServer(Db db) {
  return (Angel app) async {
    app.use('/api/posts', new PostService(db.collection('posts')));

    HookedService service = app.service('api/posts');
    app.container.singleton(service.inner);

    service
      ..beforeCreated.listen(AUTHORS_ONLY.toHook())
      ..beforeModified.listen(AUTHORS_ONLY.toHook())
      ..beforeUpdated.listen(AUTHORS_ONLY.toHook())
      ..beforeRemoved.listen(AUTHORS_ONLY.toHook())
      ..afterAll(relations.belongsTo('api/categories'));
  };
}

/// Manages [Post] in the database.
class PostService extends MongoTypedService<Post> {
  PostService(collection) : super(collection) {
    // Your logic here!
  }
}
