import 'package:ashira_flutter/screens/AllSongs.dart';
import 'package:ashira_flutter/screens/Contracts.dart';
import 'package:ashira_flutter/screens/Promo.dart';
import 'package:ashira_flutter/screens/Sing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: '/allSongs',
            routes: {
              '/': (context) => Promo(),
              '/contracts': (context) => Contracts(),
              '/allSongs': (context) => AllSongs(),
              '/sing': (context) => Sing(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Icon(Icons.cloud),
        );
      },
    );
  }
}
