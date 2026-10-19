import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerScreenDart extends StatefulWidget {
  const FilePickerScreenDart({super.key});

  @override
  State<FilePickerScreenDart> createState() => _FilePickerScreenDartState();
}

class _FilePickerScreenDartState extends State<FilePickerScreenDart> {
  String? selectedFileName;
  String? selectedFilePath;
  String? errorMessage;
  bool isPicking = false;
  Future<void> pickPdf() async {
    setState(() {
      isPicking = true;
      errorMessage = null;
    });
    try {
      final result = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ["pdf", "jpg", "jpeg"],
      );
      if (!mounted) {
        return;
      }
      // null result means
      setState(() {
        selectedFileName = result?.name;
        selectedFilePath = result?.path;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        errorMessage = "could not select the file";
      });
    } finally {
      if (mounted) {
        setState(() => isPicking = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose a pdf")),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton.icon(
                onPressed: pickPdf,
                label: Text(isPicking ? "Selecting... " : "Choose a file"),
                icon: Icon(Icons.attach_file),
              ),
              if (selectedFileName != null) Text("selected: $selectedFileName"),
              if (errorMessage != null)
                Text("$errorMessage", style: TextStyle(color: Colors.red)),
              if (selectedFilePath != null) ...[
                SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(selectedFilePath!),
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
