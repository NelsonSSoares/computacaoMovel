import 'package:flutter/material.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/theme/theme.dart';
void main() {
  runApp(MaterialApp(
    title: "TODO LIST",
    home: const Home(),
    themeMode: ThemeMode.system,
    theme: lightTheme(),
    darkTheme: darkTheme()
  ));
}

