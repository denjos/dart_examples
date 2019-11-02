import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

void main(List<String> args) {
        final parser = new ArgParser()..addFlag("name", negatable: false, abbr: 'n');
        final result = parser.parse(args);
        final paths = result.rest;
        dcat(paths, result['name'] as bool);
}

Future dcat(List<String> paths, bool show) async {
  if (paths.isEmpty) {
    await stdin.pipe(stdout);
  } else {
    for (var path in paths) {
      var ln = 1;
      final lines = utf8.decoder
          .bind(File(path).openRead())
          .transform(const LineSplitter());
      try {
        await for (var line in lines) {
          if (show) {
            stdout.write('${ln++} ');
          }
          stdout.writeln(line);
        }
      } catch (_) {
        if (await FileSystemEntity.isDirectory(path)) {
          stderr.writeln('error: $path is a directory');
        } else {
          exitCode = 2;
        }
      }
    }
  }
}
