import 'package:flutter/material.dart';
import 'package:ranker/ui/view/base_view.dart';
import 'package:ranker/viewmodels/artist_input_model.dart';

class ArtistInputView extends StatefulWidget {
  @override
  _ArtistInputViewState createState() => _ArtistInputViewState();
}

class _ArtistInputViewState extends State<ArtistInputView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ArtistInputModel>(
      builder: (context, model, child) {
        return Form(
          key: model.formKey,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Add an artist'),
              actions: [
                FlatButton(
                  onPressed: () => model.save(),
                  child: Text('Spara'),
                ),
              ],
            ),
            body: Center(
              child: ListView(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 200),
                children: [
                  Divider(
                    thickness: 0.5,
                  ),
                  ListTile(
                    title: Text('Add a new song with a'),
                    trailing: DropdownButton(
                      items: [
                        DropdownMenuItem<String>(
                          value: '\n',
                          child: Text('new line'),
                        ),
                        DropdownMenuItem<String>(
                          value: ',',
                          child: Text('comma'),
                        ),
                        DropdownMenuItem<String>(
                          value: ';',
                          child: Text('semicolon'),
                        ),
                        DropdownMenuItem<String>(
                          value: '.',
                          child: Text('period'),
                        ),
                        DropdownMenuItem<String>(
                          value: ' ',
                          child: Text('space'),
                        ),
                      ],
                      onChanged: (value) => model.changeSplitPattern(value),
                      value: model.splitPattern,
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  TextFormField(
                    controller: model.artistController,
                    decoration: InputDecoration(
                      labelText: 'Artist',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 1,
                  ),
                  ListView.builder(
                    itemCount: model.albumControllers.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: model.albumControllers[index],
                                    decoration: InputDecoration(
                                      labelText: 'Album',
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Theme.of(context).colorScheme.error,
                                  onPressed: () => model.removeAlbum(index),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: model.songControllers[index],
                              decoration: InputDecoration(
                                labelText: 'Songs',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              onSaved: (value) => model.songsOnSaved(index, value),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text('Add album'),
                    onPressed: () => model.addAlbum(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
