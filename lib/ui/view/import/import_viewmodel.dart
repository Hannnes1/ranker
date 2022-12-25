import 'package:ranker/app/app.locator.dart';
import 'package:ranker/models/user_list.dart';
import 'package:ranker/services/file_service.dart';
import 'package:stacked/stacked.dart';

class ImportViewModel extends BaseViewModel {
  final FileService _fileService = locator<FileService>();

  List<ListItem>? _selectedFile;

  Future<void> selectAndParseFile() async {
    final bytes = (await _fileService.pickFile())?.files.single.bytes;

    List<List<String>>? parsed;

    if (bytes == null) return;

    parsed = await _fileService.parseCsv(String.fromCharCodes(bytes));

    // Remove headers
    parsed.removeAt(0);

    _selectedFile = [];

    for (var i = 0; i < parsed.length; i++) {
      final row = parsed[i];

      _selectedFile!.add(
        ListItem(
          value: row[0],
          category: row[1],
          index: null,
        ),
      );
    }
  }

  Future<void> uploadFile() async {
    final docRef = await userListsRef.add(UserList(name: 'newTestList'));

    for (final item in _selectedFile!) {
      await userListsRef.doc(docRef.id).items.add(item);
    }
  }
}
