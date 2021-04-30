import 'dart:io';

import 'package:dart/configurator.dart';
import 'package:test/test.dart';

void main () {
  test('Will set the git remote in the config.', () {
    var config = Configurator();
    config.setGitRemote('git@remote.test');
    expect(config.asMap()['repository'], equals('git@remote.test'));
  });

  test('It will write a new config file', () {
    var config = Configurator();
    config.createConfig('test.json');

    var file = File('test.json');
    expectConfigFile(file);
  });
}

void expectConfigFile(File file) async {
  expect(equals(await file.exists()), true);

  await file.delete();
}
