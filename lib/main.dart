import 'package:flutter/material.dart';
import 'package:frontend/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'server task',
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
