import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';

class FlutterGeneratorCli extends CommandRunner<int> {
  FlutterGeneratorCli()
      : super(
          'flutter_generator_cli',
          'A command-line tool to generate Flutter files.',
        ) {
    addCommand(CreateCommand());
  }
  @override
  Future<int> run(Iterable<String> args) async {
    try {
      final args0 = parse(args);
      return await runCommand(args0) ?? 0;
    } catch (e) {
      print(e);
    }
    exit(0);
  }
}

class CreateCommand extends Command<int> {
  @override
  final name = 'create';
  @override
  final description = 'Creates a file from a template with the given name.';

  CreateCommand() {
    argParser.addOption(
      'file',
      abbr: 'f',
      help: 'Create a file with the given name.',
    );
  }

  @override
  Future<int> run() async {
    final parser = ArgParser();
    if(argResults == null) {
      print('Command not provided. Use --help for usage information.');
      return 0;
    }
    if (argResults!['help']) {
      print('Usage: flutter_generator_cli [options]');
      print(parser.usage);
      return 3;
    }

    if (argResults!.wasParsed('file')) {
      final filename = argResults!['file']as String?;
      if (filename != null && filename.isNotEmpty) {
        createTemplateFile(filename);
      } else {
        print('Please provide a valid filename.');
      }
    } else {
      print('No command provided. Use --help for usage information.');
    }
    return 0;
  }

  void createTemplateFile(String filename) {
    final file = File(filename);
    const templateContent = '''
// Sample Template
void main() {
  print('Hello, World!');
}
''';

    file.writeAsStringSync(templateContent);
    print('File "$filename" created successfully with a sample template.');
  }
}
