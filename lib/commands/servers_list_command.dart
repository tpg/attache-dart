import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:console/console.dart';
import 'package:dart/configuration_provider.dart';

class ServersListCommand extends Command {
  @override
  String get description => 'List the configured servers';

  @override
  String get name => 'servers:list';

  ServersListCommand() {
    argParser.addOption(
      'config',
      abbr: 'c',
      valueHelp: 'filename',
      help: 'Attache config file',
      defaultsTo: '.attache.json'
    );
  }

  @override
  void run() async {
    var provider = ConfigurationProvider();
    await provider.loadConfigFile(argResults['config']);

    var server = provider.servers().first;
  }

}
