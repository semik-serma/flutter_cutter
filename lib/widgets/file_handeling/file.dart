import 'dart:io';

Future<void> createFile() async {
  final file = File("some/path/note.txt");
  await file.create(recursive: true);
  await file.writeAsString('Learning flutter file handeling by semik');
  print("File created Successfully");
}

void main() {
  createFile();
}
