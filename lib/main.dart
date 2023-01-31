import 'package:flutter/material.dart';
import 'package:news_provider/pages/tabs_page.dart';
import 'package:news_provider/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: TabsPage(),
    );
  }
}
