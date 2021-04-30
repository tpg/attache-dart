import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:console/console.dart';
import 'package:dart/configuration_provider.dart';
import 'package:dart/console/table.dart';
import 'package:dart/server.dart';

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

    printServers(provider.servers());
  }

  void printServers(Iterable<Server> servers) {

      var consoleTable = ConsoleTable(
      headers: [
        'Name',
        'Host'
      ],
      rows: servers.map((Server server) => [
        server.name,
        server.host,
      ])
    );

    consoleTable.printTable();
  }

  String _serverName(Server server) {
    var pen = TextPen();

    pen.setColor(Color.GREEN);
    pen.text(server.name);

    return pen.toString();
  }

  String _serverString(Server server) {
    var pen = TextPen();

    pen.setColor(Color.YELLOW);
    pen.text(server.user);
    pen.setColor(Color.GREEN);
    pen.text('@${server.host}');

    return pen.toString();
  }

}
