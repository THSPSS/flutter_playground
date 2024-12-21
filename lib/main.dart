import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/user_model.dart';

import 'home_page.dart';

// Providers
// Provider (object that provider widgets / read only widgets)
// hot reload not work
// changing value
// final nameProvider = Provider<String>((ref) => 'seon yeong');

//StateProvider / can changing value
// final nameProvider = StateProvider<String?>((ref) => null);

//StateNotifier and StateNotifierProvider
final userProvider =
    StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier(
          User(
            name: '',
            age: 0,
          ),
        ));

void main() {
  runApp(
    //tracking of provider
    //global
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
