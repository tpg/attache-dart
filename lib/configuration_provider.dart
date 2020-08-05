import 'dart:convert';
import 'dart:io';

import 'package:dart/server.dart';

class ConfigurationProvider {
  Map config;

  Future<void> loadConfigFile(String filename) async {
    var content = await File(filename).readAsString();

    config = JsonDecoder().convert(content);
  }

  List<Server> servers() {
    var serverConfig = config['servers'];

    var servers = <Server>[];
    for (var name in serverConfig.keys) {
      servers.add(Server(
        name: name,
        config: serverConfig[name],
      ));
    }

    return servers;
  }
}
