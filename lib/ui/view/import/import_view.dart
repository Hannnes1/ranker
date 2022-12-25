import 'package:flutter/material.dart';
import 'package:ranker/ui/view/import/import_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ImportView extends StatelessWidget {
  const ImportView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImportViewModel>.reactive(
      viewModelBuilder: () => ImportViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Import'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: model.selectAndParseFile,
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: model.uploadFile,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
