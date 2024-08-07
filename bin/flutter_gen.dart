import 'dart:io';

import 'package:flutter_generator_cli/flutter_generator_cli.dart';


Future<void> main(List<String> args) async {
  try {
    exit(await FlutterGeneratorCli().run(args));
  } catch (e) {
    rethrow;
  }
}