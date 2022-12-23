import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:ranker/ui/view/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            InkWell(
              onTap: model.signedIn ? model.openProfile : null,
              child: const UserAvatar(
                size: 40,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: model.signIn,
              child: const Text('Sign in'),
            ),
            ElevatedButton(
              onPressed: model.openSort,
              child: const Text('Sort'),
            ),
          ],
        ),
      ),
    );
  }
}
