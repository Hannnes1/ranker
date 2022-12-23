import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<AuthProvider> get providers => [
        EmailAuthProvider(),
        GoogleProvider(
          clientId: '671162613596-7vm5o3g427bpuncgskpb8n7pp3cvl78g.apps.googleusercontent.com',
        ),
      ];

  User? get currentUser => _auth.currentUser;
}
