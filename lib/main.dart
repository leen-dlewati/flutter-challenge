import 'package:challenge/Pokemons.dart';
import 'package:flutter/material.dart';
import 'Animations.dart';
import 'Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF63B2F2))
          // useMaterial3: true,
          ),
      home: HomePage(),
      routes: {
        Animations.id: (context) =>  Animations(),
        Pokemons.id: (context) =>  Pokemons(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

