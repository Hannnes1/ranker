import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:ranker/ui/view/sign_in/sign_in_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => SignInScreen(
        providers: model.authProviders,
        actions: [
          AuthStateChangeAction<SignedIn>(model.onSignedIn),
        ],
      ),
    );
  }
}
