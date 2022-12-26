import 'package:flutter/material.dart';
import 'package:ranker/ui/view/sort/sort_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SortView extends StatelessWidget {
  const SortView({
    super.key,
    required this.listId,
  });

  final String listId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SortViewModel>.reactive(
      viewModelBuilder: () => SortViewModel(
        listId: listId,
      ),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Sort'),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.remainingComparisons),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () => model.select(-1),
                          child: Text(model.value1),
                        ),
                      ),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () => model.select(1),
                          child: Text(model.value2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (model.isBusy)
              Positioned.fill(
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
