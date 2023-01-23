import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/screen/change_notifier_provider_screen.dart';
import 'package:river_pod/screen/future_provider_screen.dart';
import 'package:river_pod/screen/state_notifier_provider_screen.dart';
import 'package:river_pod/screen/stream_provider_screen.dart';
import 'package:river_pod/screen/value_provider_screen.dart';
import 'package:river_pod/widget/text_button_supplied_by_provider_screen.dart';

import 'screen/state_provider_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: const [
            TextButtonSuppliedByProviderScreen(
                buttonName: 'Value Provider', child: ValueProviderScreen()),
            TextButtonSuppliedByProviderScreen(
                buttonName: 'State Provider', child: StateProviderScreen()),
            TextButtonSuppliedByProviderScreen(
                buttonName: 'Future Provider', child: FutureProviderScreen()),
            TextButtonSuppliedByProviderScreen(
                buttonName: 'Stream Provider', child: StreamProviderScreen()),
            TextButtonSuppliedByProviderScreen(
                buttonName: 'ChangeNotifier Provider',
                child: ChangeNotifierProviderScreen()),
            TextButtonSuppliedByProviderScreen(
                buttonName: 'StateNotifier Provider',
                child: StateNotifierProviderScreen()),
          ],
        ),
      ),
    );
  }
}
