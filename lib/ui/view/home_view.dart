import 'package:flutter/material.dart';
import 'package:ranker/enums/view_state.dart';
import 'package:ranker/ui/view/base_view.dart';
import 'package:ranker/viewmodels/home_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.loadArtists(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(),
          body: model.state == ViewState.Busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    StreamBuilder<List<Map>>(
                      stream: model.artistController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(snapshot.data[index]['artist']),
                                onTap: () =>
                                    Navigator.pushNamed(context, '/comparison', arguments: snapshot.data[index])
                                        .then((_) {
                                  print('back');
                                  return model.loadArtists();
                                }),
                                trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Theme.of(context).colorScheme.error,
                                    onPressed: () => model.loadArtists(
                                          remove: snapshot.data[index]['artist'],
                                        )),
                              );
                            },
                            separatorBuilder: (context, _) => Divider(),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text('Add new artist'),
                      onPressed: () => Navigator.pushNamed(context, '/artistInput'),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
