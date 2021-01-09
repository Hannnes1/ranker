import 'package:flutter/material.dart';
import 'package:ranker/enums/view_state.dart';
import 'package:ranker/ui/view/base_view.dart';
import 'package:ranker/viewmodels/comparison_model.dart';

class ComparisonView extends StatelessWidget {
  final Map artist;

  const ComparisonView({Key key, this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ComparisonModel>(
      onModelReady: (model) => model.init(artist),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : model.unsorted != 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RaisedButton(
                                child: Text(model.song1),
                                onPressed: () => model.sort(model.song1),
                              ),
                              RaisedButton(
                                child: Text(model.song2),
                                onPressed: () => model.sort(model.song2),
                              ),
                            ],
                          ),
                          RaisedButton(
                            child: Text('Save progress'),
                            onPressed: () => model.saveProgress(),
                          ),
                          RaisedButton(
                            child: Text('Undo'),
                            onPressed: () => model.undo(),
                          ),
                        ],
                      )
                    : Center(
                        child: Text('You are done'),
                      ),
          ),
        );
      },
    );
  }
}
