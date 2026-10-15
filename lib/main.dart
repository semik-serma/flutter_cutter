import 'package:flutter/material.dart';
import 'package:new_flutter_project/responsive/constrained_widget.dart';
import 'package:new_flutter_project/sliver_screen.dart';
import 'package:new_flutter_project/stack.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (_) => ContsTrainedBox(),
        '/mystack': (_) => Mystack(),
        '/sliverscreen': (_) => SliverScreen(),
      },
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
          primary: const Color.fromARGB(255, 0, 251, 255),
          secondary: Colors.redAccent,
        ),

        scaffoldBackgroundColor: Colors.grey.shade900,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 47, 237, 0),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),

        useMaterial3: true,
        cardTheme: CardThemeData(
          color: const Color.fromARGB(255, 244, 243, 243),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 236, 238, 239),
          brightness: Brightness.dark,
          primary: const Color.fromARGB(255, 238, 235, 237),
          secondary: const Color.fromARGB(255, 255, 255, 255),
        ),

        scaffoldBackgroundColor: Colors.grey.shade900,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 51, 255, 0),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),

        useMaterial3: true,
        cardTheme: CardThemeData(
          color: const Color.fromARGB(255, 227, 220, 220),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      // home: const Signup(),
    );
  }
}
