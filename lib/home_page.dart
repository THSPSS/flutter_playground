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

  // void onSubmit(WidgetRef ref, String value) {
  //   //can change value
  //   //current state
  //   // ref.read(nameProvider.notifier).update((state) => value);
  //   ref.read(userProvider.notifier).updateName(value);
  //   // ref.read(userChangeNotifierProvider).updateName(value);
  // }

  // void onSubmitAge(WidgetRef ref, String ageValue) {
  //   //can change value
  //   //current state
  //   // ref.read(nameProvider.notifier).update((state) => value);
  //   ref.read(userProvider.notifier).updateAge(int.parse(ageValue));
  //   // ref.read(userChangeNotifierProvider).updateAge(int.parse(ageValue));
  // }

  // ConsumerWidget : name value changed and entire widget is rebuild
  @override
  //Provider ref / widgetRef
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(fetchUserProvioder).map(data: (data) {
    //   data.value.name;
    // }, error: error, loading: loading);
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

    // final user = ref.watch(userProvider);
    // final user = ref.watch(userChangeNotifierProvider).user;

    //only rerun the entire widget tree when class value has changed
    // final user = ref.watch(userProvider.select((value) => value.name));
    // final age = ref.watch(userProvider.select((value) => value.age));

    //asyncValue
    return ref.watch(fetchUserProvioder).when(
      data: (data) {
        return Scaffold(
            appBar: AppBar(
              title: Text(data.name),
            ),
            //example 2. using consumer
            // just change center widget that has name variable
            // there is no unnecessary rebuld
            body: Column(
              children: [
                TextField(
                    //change nameProvider
                    // onSubmitted: (value) => onSubmit(ref, value),
                    ),
                TextField(
                    //change age
                    // onSubmitted: (value) => onSubmitAge(ref, value),
                    ),
                Center(
                  child: Text(
                    data.email,
                  ),
                ),
              ],
            ));
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(
              error.toString(),
            ),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //streamProvider
    // return Scaffold(
    //   body: ref.watch(streamProvider).when(
    //     data: (data) {
    //       return Center(
    //         child: Text(
    //           //[1,2,3,4,5,6,7,8,9,10]
    //           data.toString(),
    //         ),
    //       );
    //     },
    //     error: (error, stackTrace) {
    //       return Center(
    //         child: Text(
    //           error.toString(),
    //         ),
    //       );
    //     },
    //     loading: () {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     },
    //   ),
    // );
  }
}
