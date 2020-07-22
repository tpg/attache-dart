import 'package:console/console.dart';

abstract class Command {

  String _name;
  String _description;

  Command() {
    configure();
  }

  void configure();

  Command setName(String name) {
    _name = name;
    return this;
  }

  Command setDescription(String description) {
    _description = description;
    return this;
  }

  void printHelp() {
    var pen = TextPen();

    pen.setColor(Color.BLUE);
    pen.text('  $_name');
    pen.setColor(Color.WHITE);
    pen.text('\t\t$_description');
    pen.print();
  }
}