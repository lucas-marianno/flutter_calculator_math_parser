import 'package:flutter/material.dart';
import 'logic.dart';
import 'style.dart';
import 'keyboard_layout.dart';
import 'screen.dart';
import 'package:flutter/services.dart';
import 'about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: defaultButtonThemeData(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String screenValue = '0';

  updateScreen(buttonId){
    setState(() {
      screenValue = Logic.newScreenValue(buttonId, screenValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.darkest,
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const AboutPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Palette.light,),
                  ),
                ),
                Screen(screenValue),
                KeyBoard(updateScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
