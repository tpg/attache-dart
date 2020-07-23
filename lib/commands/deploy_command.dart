import 'package:args/command_runner.dart';

class DeployCommand extends Command {
  @override
  String get description => 'Deploy to the specified server';

  @override
  // TODO: implement name
  String get name => 'deploy';

  @override
  void run() {
    print(argResults.arguments);
  }

  DeployCommand() {
    argParser.addFlag('prune', help: 'Prune old releases', negatable: false);
    argParser.addOption(
        'server',
        help: 'Server name',
        valueHelp: 'server'
    );
  }
}
