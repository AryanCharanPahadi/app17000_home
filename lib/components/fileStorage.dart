import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileStorage {
  static Future<String> getExternalDocumentPath() async {
    // Check and request storage permission
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }

    // Handle permission denied scenario
    if (!status.isGranted) {
      throw Exception("Storage permission not granted");
    }

    Directory directory = Directory("");
    if (Platform.isAndroid) {
      // Use Android's download directory
      directory = Directory("/storage/emulated/0/Download");
    } else {
      // Fallback for iOS or other platforms
      directory = await getApplicationDocumentsDirectory();
    }

    final exPath = directory.path;
    print("Saved Path: $exPath");
    await Directory(exPath).create(recursive: true);
    return exPath;
  }

  static Future<String> get _localPath async {
    final String directory = await getExternalDocumentPath();
    return directory;
  }

  static Future<File> writeToFile(String content, String fileName) async {
    try {
      final path = await _localPath;
      File file = File('$path/$fileName');
      print("Saving file at: $path/$fileName");

      // Write data to the file (this overwrites existing content)
      return file.writeAsString(content, mode: FileMode.write);
    } catch (e) {
      print("Error writing file: $e");
      throw Exception("Failed to save file");
    }
  }
}
