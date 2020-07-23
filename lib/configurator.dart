import 'dart:convert';
import 'dart:io';
import 'package:git/git.dart';
import 'package:path/path.dart' as path;

class Configurator {
  final defaultConfig = {
    'repository': 'git@repo.com',
    'servers': {
      'server-mame': {
        'host': 'server.com',
        'user': 'user',
        'port': 22,
        'root': '/root/to/project',
        'paths': {
          'releases': 'releases',
          'serve': 'live',
          'storage': 'storage',
          'env': '.env',
        }
      }
    }
  };


  /// Get the JSON encoded configuration.
  String encodedConfig(String gitRemote) {
    var encoder = JsonEncoder.withIndent('    ');
    var config = defaultConfig;
    config['repository'] = gitRemote;

    return encoder.convert(config);
  }

  /// Get the Git remote from the Git config.
  /// We'll actually run `git remote -v` here to get the list of remotes.
  Future<String> _getGitRemote() async {
    if (await GitDir.isGitDir(path.current)) {
      var result = await Process.run(
        'git',
        ['remote', '-v'],
        workingDirectory: path.current,
        runInShell: true,
      );
      var regExp = RegExp(
        r'^(?<name>.+?)\s(?<url>.+?)\s\(fetch\)$',
        multiLine: true,
      );
      var matches = regExp.allMatches(result.stdout.toString());

      if (matches.length == 1) {
        return matches.first.namedGroup('url');
      }

      return _selectRemote(matches);
    }

    return null;
  }

  /// Allow user to select the Git remote.
  String _selectRemote(Iterable<RegExpMatch> matches) {
    return matches.first.namedGroup('url');
  }

  /// Create a new Attaché configuration file.
  void createConfig(String filename) async {
    var remote = await _getGitRemote();

    await File(filename).writeAsString(encodedConfig(remote));
  }
}
