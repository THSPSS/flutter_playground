import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:playground/logger_riverpod.dart';
import 'package:playground/user_model.dart';

import 'home_page.dart';

part 'main.g.dart';

// <Providers>
//1. Provider (object that provider widgets / read only widgets)
// hot reload not work changing value
// final nameProvider = Provider<String>((ref) => 'seon yeong');

//2. StateProvider / can changing value
// final nameProvider = StateProvider<String?>((ref) => null);

//3. StateNotifier and StateNotifierProvider -> rec
// final userProvider =
//     StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());

//4. ChangeNotifierProvider -> mutable so it is not recommendeds
// final userChangeNotifierProvider =
//     ChangeNotifierProvider((ref) => UserNotifierChange());

//5. FutureProvider > aysnc or firebase call , http call
// final fetchUserProvioder = FutureProvider((ref) {
//   final userRepository = ref.watch(UserRepositoryProvider);
//   return userRepository.fetchUserData();
// });

//6. StreamProvider
final streamProvider = StreamProvider.autoDispose(
  // _firebaseFiresotre.collection('users').doc(userId).snapshots();
  (ref) async* {
    //lifecycle
    ref.onDispose(() {
      //dispose thing like api call
    });
    ref.onCancel(() {
      //when thing is no longer used
    });
    //pause and run again
    ref.onResume(() {});
    ref.onRemoveListener(() {});
    //all the possible value that updated and changing
    yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  },
);

//7. family
//only take single arguments
//try to using more than one arguments using tuple package
//autoDispose prevent memory reak
// final fetchUserProvioder =
//     FutureProvider.family.autoDispose((ref, String input) {
//   // ref.keepAlive();

//   final userRepository = ref.watch(userRepositoryProvider);
//   return userRepository.fetchUserData(input);
// });

@riverpod
Future<User> fetchUser(FetchUserRef ref,
    {required String input,
    required int someValue,
    required bool secondValue}) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
}

//WidgetRef
//ProviderRef
//Ref

//ProviderObserver

void main() {
  runApp(
    //tracking of provider
    //global
    ProviderScope(
      observers: [
        LoggerRiverpod(),
      ],
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
      home: MyHomePage(),
    );
  }
}
