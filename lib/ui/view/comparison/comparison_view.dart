import 'package:flutter/material.dart';
import 'package:ranker/models/json.dart';
import 'package:ranker/ui/view/comparison/comparison_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ComparisonView extends StatelessWidget {
  const ComparisonView({
    Key? key,
    required this.artist,
  }) : super(key: key);

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ComparisonViewModel>.reactive(
      viewModelBuilder: () => ComparisonViewModel(artist),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.progress),
          centerTitle: true,
        ),
        body: Center(
          child: model.isBusy
              ? const CircularProgressIndicator()
              : model.unsorted != 0
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              child: Text(model.song1),
                              onPressed: () => model.sort(model.song1),
                            ),
                            ElevatedButton(
                              child: Text(model.song2),
                              onPressed: () => model.sort(model.song2),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          child: const Text('Save progress'),
                          onPressed: () => model.saveProgress(),
                        ),
                        ElevatedButton(
                          child: const Text('Undo'),
                          onPressed: () => model.undo(),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: model.songs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(model.sortedSongs[index].name),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
