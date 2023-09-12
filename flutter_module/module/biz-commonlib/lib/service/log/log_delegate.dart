import 'dart:convert';
import 'dart:io';

import 'package:common_lib/config/env_config/index.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LogFilterDelegate extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (Env.isRelease && event.level != Level.debug) {
      return true;
    }
    if (!Env.isRelease) {
      return true;
    }
    return false;
  }
}

/// Writes the log output to a file.
class FileOutput extends LogOutput {
  final String fileName;
  final bool overrideExisting;
  final Encoding encoding;
  IOSink? _sink;

  FileOutput({
    this.fileName = '',
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  @override
  void init() {
    getApplicationDocumentsDirectory().then((value) {
      File file = File('${value.path}$fileName');
      _sink = file.openWrite(
        mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
        encoding: encoding,
      );
    });
  }

  @override
  void output(OutputEvent event) {
    _sink?.writeAll(event.lines, '\n');
  }

  @override
  void destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}

class LogConfiguration {
  static LogOutput get logOutPut =>
      Env.isRelease ? FileOutput(fileName: '/xLog.txt') : ConsoleOutput();

  static LogPrinter get logPrinter => Env.isRelease
      ? PrettyPrinter(
          colors: false, printEmojis: false, printTime: false, methodCount: 8)
      : SimplePrinter();
}
