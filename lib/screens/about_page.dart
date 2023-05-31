import 'package:calculator2/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../style.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAboutScreenBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: kAboutScreenBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 100,
            foregroundImage: AssetImage("assets/avatar.png"),
          ),
          Text(
            'Lucas Marianno'.toUpperCase(),
            style: GoogleFonts.shadowsIntoLight(
              fontSize: 80,
              color: Colors.white,
              shadows: [
                const Shadow(
                  color: kShadowColor,
                  offset: Offset(1, 1),
                  blurRadius: 5,
                )
              ],
            ),
          ),
          const Divider(
            color: kTextColor,
            indent: 100,
            endIndent: 100,
          ),
          Text(
            'flutter developer'.toUpperCase(),
            style: GoogleFonts.fjallaOne(
              fontSize: 25,
              color: kTextColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 8,
              //fontStyle: FontStyle.italic,
              shadows: [
                const Shadow(
                  color: kShadowColor,
                  offset: Offset(1, 1),
                  blurRadius: 5,
                )
              ],
            ),
          ),
          const Divider(
            color: kTextColor,
            indent: 100,
            endIndent: 100,
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                ElevatedButton(
                  style: aboutPageButtonStyle(),
                  onPressed: () => url_launcher
                      .launchUrl(Uri(scheme: 'tel', path: '+55(11)99999-9999')),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.phone,
                        color: kTextColor,
                      ),
                      Text('+55 (11) 99999-9999'),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: aboutPageButtonStyle(),
                  onPressed: () => url_launcher.launchUrl(
                      Uri.parse('https://github.com/lucas-marianno'),
                      mode: LaunchMode.externalApplication),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.open_in_new,
                        color: kTextColor,
                      ),
                      Text('GitHub/lucas-marianno'),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: aboutPageButtonStyle(),
                  onPressed: () => url_launcher.launchUrl(
                      Uri(scheme: 'mailto', path: 'lucas.pk16@outlook.com'),
                      mode: LaunchMode.externalApplication),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.email,
                        color: kTextColor,
                      ),
                      Text('lucas.pk16@outlook.com'),
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
