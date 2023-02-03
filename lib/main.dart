import 'package:flutter/material.dart';
import 'package:gedox_task/view/home.dart';
import 'package:provider/provider.dart';

import 'controller/controller.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Controller>(create: (_) => Controller())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
