import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/initial/presentation/pages/initial_page.dart';
import 'features/main/presentation/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food order',
      theme: ThemeData(
      ),
      initialRoute: InitialPage.id,
      routes: {
        InitialPage.id: (context) => const InitialPage(),
        MainPage.id: (context) => const MainPage(),
      },
    );
  }
}

