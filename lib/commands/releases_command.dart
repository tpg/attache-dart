import 'package:dart/commands/command.dart';

class ReleasesCommand extends Command {
  @override
  void configure() {
    setName('releases:list');
    setDescription('Display a list of releases on the specified server.');
  }

}