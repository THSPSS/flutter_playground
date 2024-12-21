import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/main.dart';

// class MyWidget extends ConsumerStatefulWidget {
//   const MyWidget({super.key});

//   @override
//   ConsumerState<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends ConsumerState<MyWidget> {

//   // @override
//   // void initState() {
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     //using function or initState
//     final name = ref.watch(nameProvider);
//     return Scaffold(
//         appBar: AppBar(),
//         //example 2. using consumer
//         // just change center widget that has name variable
//         // there is no unnecessary rebuld
//         body: Column(
//               children: [
//                 Center(
//                   child: Text(name),
//                 ),
//               ],
//             ));
//   }
// }

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void onSubmit(WidgetRef ref, String value) {
    //can change value
    //current state
    // ref.read(nameProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String ageValue) {
    //can change value
    //current state
    // ref.read(nameProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateAge(int.parse(ageValue));
  }

  // ConsumerWidget : name value changed and entire widget is rebuild
  @override
  //Provider ref / widgetRef
  Widget build(BuildContext context, WidgetRef ref) {
    // example 1. using consumerwidget and widgetRef
    //continously watching provider and update it
    // Widget build(BuildContext context, WidgetRef ref) {
    // final name = ref.watch(nameProvider);
    // cannot change nameProvider value

    // read is one time thing only
    // final name = ref.read(nameProvider) ?? '';
    //watch is recommended than read
    // final name = ref.watch(nameProvider) ?? '';
    //final name = ref.read(nameProvider) != null ? ref.read(nameProvider) : '';

    final user = ref.watch(userProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        //example 2. using consumer
        // just change center widget that has name variable
        // there is no unnecessary rebuld
        body: Column(
          children: [
            TextField(
              //change nameProvider
              onSubmitted: (value) => onSubmit(ref, value),
            ),
            TextField(
              //change age
              onSubmitted: (value) => onSubmitAge(ref, value),
            ),
            Center(
              child: Text(
                user.age.toString(),
              ),
            ),
          ],
        ));
  }
}
