import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:ranker/ui/view/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
 const ProfileView({super.key});

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<ProfileViewModel>.reactive(
     viewModelBuilder: () => ProfileViewModel(),
     builder: (context, model, child) => ProfileScreen(
      providers: model.authProviders,
     ),
   );
 }
}