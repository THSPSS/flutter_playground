import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ConsumerWidget : name value changed and entire widget is rebuild
  @override
  //Provider ref / widgetRef
  Widget build(BuildContext context) {
    // example 1. using consumerwidget and widgetRef
    //continously watching provider and update it
    // Widget build(BuildContext context, WidgetRef ref) {
    // final name = ref.watch(nameProvider);
    // cannot change nameProvider value

    // read is one time thing only
    //final nameRead = ref.read(nameProvider);

    return Scaffold(
        appBar: AppBar(),
        //example 2. using consumer
        // just change center widget that has name variable
        // there is no unnecessary rebuld
        body: Consumer(
          builder: (context, ref, child) {
            final name = ref.watch(nameProvider);
            return Column(
              children: [
                Center(
                  child: Text(name),
                ),
              ],
            );
          },
        ));
  }
}
