import 'dart:io';

import 'package:meta/meta.dart';

class Server {

  String name;
  Map<String, dynamic> config;

  String get host => setting('host');
  int get port => setting('port');
  String get user => setting('user');
  String get root => setting('root');
  String get branch => setting('branch');

  Server({@required String name, @required Map<String, dynamic> config}) {
    this.name = name;
    this.config = config;
  }

  dynamic setting(String key) {
    return config[key];
  }

  String path(String key) {
    Map paths = setting('paths');

    if (!paths.containsKey(key)) {
      throw 'No path key $key';
    }

    return paths[key];
  }

  Map php(String key) {
    Map php = setting('php');

    if (!php.containsKey(key)) {
      throw 'No php configuration key $key';
    }

    return php[key];
  }
}