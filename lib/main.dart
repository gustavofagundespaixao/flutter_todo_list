import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/pages/home_page.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo list',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(),
          textTheme: GoogleFonts.comfortaaTextTheme(),
        ),
        textTheme: GoogleFonts.comfortaaTextTheme(),
        accentColor: Colors.purple,
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
