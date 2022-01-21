import 'package:flutter/material.dart';
import 'package:ranker/ui/view/artist_input/artist_input_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ArtistInputView extends StatelessWidget {
  const ArtistInputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArtistInputViewModel>.reactive(
      viewModelBuilder: () => ArtistInputViewModel(),
      builder: (context, model, child) => Form(
        key: model.formKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add an artist'),
            actions: [
              IconButton(
                onPressed: () => model.save(),
                icon: const Icon(Icons.save),
              ),
            ],
          ),
          body: Center(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 200),
              children: [
                const Divider(
                  thickness: 0.5,
                ),
                ListTile(
                  title: const Text('Add a new song with a'),
                  trailing: DropdownButton(
                    items: const [
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
                const Divider(
                  thickness: 0.5,
                ),
                TextFormField(
                  controller: model.artistController,
                  decoration: const InputDecoration(
                    labelText: 'Artist',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 1,
                ),
                ListView.builder(
                  itemCount: model.albumControllers.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: model.albumControllers[index],
                                  decoration: const InputDecoration(
                                    labelText: 'Album',
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: Theme.of(context).colorScheme.error,
                                onPressed: () => model.removeAlbum(index),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: model.songControllers[index],
                            decoration: const InputDecoration(
                              labelText: 'Songs',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            onSaved: (value) => model.songsOnSaved(index, value!),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Please enter a song'
                                : null,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('Add album'),
                  onPressed: () => model.addAlbum(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
