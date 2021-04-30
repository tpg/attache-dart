import 'dart:convert';
import 'dart:io';

import 'package:dart/configurator.dart';
import 'package:dart/server.dart';

class ConfigurationProvider {
  Map config;

  Future<void> loadConfigFile(String filename) async {
    var content = await File(filename).readAsString();

    loadConfig(JsonDecoder().convert(content));
  }

  void loadConfig(Map<String, dynamic> config) {
    this.config = config;
  }

  List<Server> servers() {
    var serverConfig = config['servers'];

    var servers = <Server>[];
    for (var name in serverConfig.keys) {
      servers.add(Server(
        name: name,
        config: _getServerConfig(serverConfig[name]),
      ));
    }

    return servers;
  }

  Map<String, dynamic> _getServerConfig(Map<String, dynamic> serverConfig) {
    Map<String, dynamic> common = config['common'];
    common.addAll(serverConfig);

    return common;
  }
}
