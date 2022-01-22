import 'package:flutter/material.dart';
import 'package:ranker/models/json.dart';
import 'package:ranker/ui/view/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: model.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  StreamBuilder<List<Artist>>(
                    stream: model.artistController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].name),
                              onTap: () => model.goToComparison(snapshot.data![index]),
                              trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Theme.of(context).colorScheme.error,
                                  onPressed: () => model.loadArtists(
                                        remove: snapshot.data![index].name,
                                      )),
                            );
                          },
                          separatorBuilder: (context, _) => const Divider(),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Add new artist'),
                    onPressed: () => model.goToArtistInput(),
                  ),
                ],
              ),
      ),
    );
  }
}
