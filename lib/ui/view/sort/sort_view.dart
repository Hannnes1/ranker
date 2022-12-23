import 'package:flutter/material.dart';
import 'package:ranker/ui/view/sort/sort_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SortView extends StatelessWidget {
  const SortView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SortViewModel>.reactive(
      viewModelBuilder: () => SortViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Sort'),
        ),
        body: Column(
          children: [
            Text(model.remainingComparisons),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => model.select(-1),
                    child: Text(model.value1),
                  ),
                  ElevatedButton(
                    onPressed: () => model.select(1),
                    child: Text(model.value2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
