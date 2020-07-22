import 'package:console/console.dart';
import 'package:dart/commands/command.dart';
import 'package:dart/commands/deploy_command.dart';
import 'package:dart/commands/install_command.dart';
import 'package:dart/commands/releases_command.dart';
import 'package:meta/meta.dart';

class Attache {
  String _version;
  List<Command> _commands;

  Attache({@required String version}) {
    _version = version;

    _addCommands([
      DeployCommand(),
      InstallCommand(),
      ReleasesCommand(),
    ]);

  }

  void _addCommands(List<Command> commands) {
    _commands = commands;
  }

  void _printVersion() {
    var pen = TextPen();

    pen.setColor(Color.WHITE);
    pen.text('Attache Dart ');
    pen.setColor(Color.BLUE);
    pen.text('$_version\n');
    pen.print();
  }

  void _printHelp() {
    for (var command in _commands) {
      command.printHelp();
    }
  }

  void run() {
    Console.init();

    _printVersion();
    _printHelp();
  }
}
