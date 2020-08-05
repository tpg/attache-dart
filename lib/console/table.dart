import 'package:console/console.dart';

import 'package:meta/meta.dart';

class ConsoleTable {
  Iterable<String> headers;
  Iterable<Iterable<String>> rows;
  List<int> columnWidths;

  ConsoleTable(
      {@required Iterable<String> headers,
      @required Iterable<Iterable<String>> rows,
      List<int> widths}) {
    this.headers = headers;
    this.rows = rows;

    columnWidths = widths ?? _calculateColumnWidths();
  }

  void printTable() {
    columnWidths = _calculateColumnWidths();
    var pen = TextPen();

    _printRow(pen, headers);

    pen.buffer.clear();
    _tableDivider(pen);

    rows.forEach((row) {
      pen.buffer.clear();
      _printRow(pen, row);
    });
  }

  void _printRow(TextPen pen, Iterable<String> row) {
    _tableBorder(pen);

    var column = 0;
    row.forEach((cell) {
      pen.setColor(Color.WHITE);
      pen.text(' ${cell.padRight(columnWidths[column])} ');
      _tableBorder(pen);
      column++;
    });
    pen.print();
  }

  List<int> _calculateColumnWidths() {
    var widths = headers.map((header) => header.length).toList();

    rows.forEach((row) {
      for (var i = 0; i < headers.length; i++) {
        var cell = row.elementAt(i);

        widths[i] = cell.length > widths[i] ? cell.length : widths[i];
      }
    });

    return widths;
  }

  void _tableBorder(TextPen pen) {
    pen.setColor(Color.WHITE);
    pen.text('|');
  }

  void _tableDivider(TextPen pen) {
    _tableBorder(pen);

    pen.setColor(Color.WHITE);
    columnWidths.forEach((width) {
      pen.text('-');
      pen.text(''.padRight(width, '-'));
      pen.text('-');
      _tableBorder(pen);
    });

    pen.print();
  }
}
