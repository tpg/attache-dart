import 'package:dart/commands/command.dart';

class InstallCommand extends Command {
  @override
  void configure() {
    setName('install');
    setDescription('Install to the specified server');
  }

}