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
    ref.read(nameProvider.notifier).update((state) => value);
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
    final name = ref.read(nameProvider) ?? '';
    //final name = ref.read(nameProvider) != null ? ref.read(nameProvider) : '';

    return Scaffold(
        appBar: AppBar(
          title: Text(name),
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
            Center(
              child: Text(name),
            ),
          ],
        ));
  }
}
