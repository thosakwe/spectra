import 'package:angel_security/angel_security.dart';

final PermissionBuilder ADMIN = new PermissionBuilder('admin');
final Permission AUTHORS_ONLY =
    new PermissionBuilder('author').or(ADMIN).toPermission();
