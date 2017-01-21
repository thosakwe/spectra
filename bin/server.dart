import 'dart:io';
import 'package:spectra/spectra.dart';

main() async {
  var app = await createServer();
  var server = await app.startServer(InternetAddress.ANY_IP_V4, 3000);
  print('Spectra listening at http://${server.address.address}:${server.port}');
}
