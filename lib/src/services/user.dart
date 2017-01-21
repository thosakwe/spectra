import 'package:angel_framework/angel_framework.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../models/user.dart';
export '../models/user.dart';

configureServer(Db db) {
  return (Angel app) async {
    app.use('/api/users', new UserService(db.collection('users')));

    HookedService service = app.service('api/users');
    app.container.singleton(service.inner);
  };
}

/// Manages [User] in the database.
class UserService extends MongoTypedService<User> {
  UserService(collection):super(collection) {
    // Your logic here!
  }
}