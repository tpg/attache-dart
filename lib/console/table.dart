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

  @override
  String toString() {
    var pen = build();
    return pen.toString();
  }

  void printTable() {
    var pen = build();
    pen.print();
  }

  TextPen build() {
    columnWidths = _calculateColumnWidths();
    var pen = TextPen();

    _row(pen, headers);

    _divider(pen);

    rows.forEach((row) {
      _row(pen, row);
    });

    return pen;
  }

  void _row(TextPen pen, Iterable<String> row) {
    _border(pen);

    var column = 0;
    row.forEach((cell) {
      pen.setColor(Color.WHITE);
      pen.text(' ${cell.padRight(columnWidths[column])} ');
      _border(pen);
      column++;
    });
    pen.text('\n');
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

  void _border(TextPen pen) {
    pen.setColor(Color.WHITE);
    pen.text('|');
  }

  void _divider(TextPen pen) {
    _border(pen);

    pen.setColor(Color.WHITE);
    columnWidths.forEach((width) {
      pen.text('-');
      pen.text(''.padRight(width, '-'));
      pen.text('-');
      _border(pen);
    });

    pen.text('\n');
  }
}
