import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:dart/configurator.dart';

class InitCommand extends Command {
  @override
  String get description => 'Create an Attaché configuration file';

  @override
  String get name => 'init';

  InitCommand() {
    argParser.addOption(
      'config',
      abbr: 'c',
      valueHelp: 'filename',
      help: 'Name of the new config file',
    );
  }

  @override
  void run() {
    var filename = argResults.options.contains('config')
        ? argResults['config']
        : '.attache.json';

    Configurator().createConfig(filename);
    print('Created Attaché configuration file at $filename');
  }
}
