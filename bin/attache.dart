import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:dart/commands/deploy_command.dart';
import 'package:dart/commands/init_command.dart';
import 'package:dart/commands/releases_list_command.dart';
import 'package:dart/commands/servers_list_command.dart';

void main(List<String> parameters) {

  var runner = CommandRunner('attache', 'Opinionated deployment tool for Laravel');

  runner.addCommand(InitCommand());
  runner.addCommand(ServersListCommand());
  runner.addCommand(ReleasesListCommand());
  runner.addCommand(DeployCommand());

  runner.run(parameters);

}
