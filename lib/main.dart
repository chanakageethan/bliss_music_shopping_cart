import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/main_provider.dart';
import 'UI/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>(
            create: (context) => MainProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Roboto",
        ),
        // routes: <String, WidgetBuilder>{
          // "/HomeScreen": (BuildContext c) => const HomeScreen(),
          // "/HomeScreen": (BuildContext c) => const HomeScreen(),
        // },
        home:  const HomeScreen(),
      ),
    );
  }
}



