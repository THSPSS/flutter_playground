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

//StateNotifier and StateNotifierProvider -> rec
// final userProvider =
//     StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());

//ChangeNotifierProvider -> mutable so it is not recommendeds
// final userChangeNotifierProvider =
//     ChangeNotifierProvider((ref) => UserNotifierChange());

//FutureProvider > aysnc or firebase call , http call
final fetchUserProvioder = FutureProvider((ref) {
  final userRepository = ref.watch(UserRepositoryProvider);
  return userRepository.fetchUserData();
});

//StreamProvider
final streamProvider = StreamProvider(
  // _firebaseFiresotre.collection('users').doc(userId).snapshots();
  (ref) async* {
    //all the possible value that updated and changing
    yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  },
);

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
