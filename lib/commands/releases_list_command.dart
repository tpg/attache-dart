import 'package:args/command_runner.dart';

class ReleasesListCommand extends Command {
  @override
  String get description => 'List the releases on the specified server';

  @override
  String get name => 'releases:list';

}