import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/api_service_testing_stream_int.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamIntWatch = ref.watch(streamIntProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        StreamBuilder(
          stream: ref.watch(streamIntProvider.stream),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Text(snapshot.data.toString());
          },
        ),
        Center(
            child: streamIntWatch.when(
                data: (int data) {
                  return Text(data.toString());
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator())),
      ]),
    );
  }
}
