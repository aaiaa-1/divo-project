import 'package:flutter/material.dart';

import 'constants/global_variables.dart';
import 'features/auth/screens/auth_screen.dart';
import 'package:divo/router.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divo',
      theme: ThemeData(

          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 152, 209, 206)),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black54))),
      onGenerateRoute: (settings) =>
          generateRoute(settings), //will run everytime we use push named route
      home: const AuthScreen(),
    );
  }
}
