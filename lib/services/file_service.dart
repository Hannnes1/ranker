import 'package:csv/csv_settings_autodetection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';

class FileService {
  final _csvParser = const CsvToListConverter();

  Future<FilePickerResult?> pickFile() async {
    return await FilePicker.platform.pickFiles();
  }

  Future<List<List<String>>> parseCsv(String fileContent) async {
    return _csvParser.convert<String>(
      fileContent,
      shouldParseNumbers: false,
      csvSettingsDetector: const FirstOccurrenceSettingsDetector(
        eols: ['\r\n', '\n'],
        textDelimiters: ['"', "'"],
      ),
    );
  }
}
