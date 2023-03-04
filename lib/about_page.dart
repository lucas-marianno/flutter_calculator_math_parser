import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'style.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

ThemeData myTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(350, 50),
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Palette.dark,
      foregroundColor: Palette.light,
    ),
  ),
  dividerTheme: DividerThemeData(
    space: 40,
    color: Palette.light,
    indent: 100,
    endIndent: 100,
  ),
);

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.dark,
        elevation: 0,
      ),
      backgroundColor: Palette.dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 100,
            foregroundImage: AssetImage("lib/assets/avatar.png"),
          ),
          Text(
            'Lucas Moraes'.toUpperCase(),
            style: GoogleFonts.shadowsIntoLight(
              fontSize: 80,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Palette.darkest,
                  offset: const Offset(1, 1),
                  blurRadius: 5,
                )
              ],
            ),
          ),
          Divider(
            color: Palette.light,
            indent: 100,
            endIndent: 100,
          ),
          Text(
            'flutter developer'.toUpperCase(),
            style: GoogleFonts.fjallaOne(
              fontSize: 25,
              color: Palette.light,
              fontWeight: FontWeight.bold,
              letterSpacing: 8,
              //fontStyle: FontStyle.italic,
              shadows: [
                Shadow(
                  color: Palette.darkest,
                  offset: const Offset(1, 1),
                  blurRadius: 5,
                )
              ],
            ),
          ),
          Divider(
            color: Palette.light,
            indent: 100,
            endIndent: 100,
          ),
          const SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                ElevatedButton(
                  style: aboutPageButtonStyle(),
                  onPressed: () => url_launcher.launchUrl(
                      Uri(scheme: 'tel', path: '+55(11)99999-9999')),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Palette.light,
                      ),
                      const Text('+55 (11) 99999-9999'),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: aboutPageButtonStyle(),
                  onPressed: () => url_launcher.launchUrl(
                      Uri.parse('https://github.com/vulture-coding'),
                      mode: LaunchMode.externalApplication),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.open_in_new,
                        color: Palette.light,
                      ),
                      const Text('GitHub/vulture-coding'),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: aboutPageButtonStyle(),
                  onPressed: () => url_launcher.launchUrl(
                      Uri(scheme: 'mailto', path: 'lucas.pk16@outlook.com'),
                      mode: LaunchMode.externalApplication),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.email,
                        color: Palette.light,
                      ),
                      const Text('lucas.pk16@outlook.com'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
