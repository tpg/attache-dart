import 'package:dart/commands/command.dart';

class DeployCommand extends Command {

  @override
  void configure() {
    setName('deploy');
    setDescription('Deploy to the specified server');
  }

}