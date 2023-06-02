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
    // TODO: Readability: rewrite AboutPage, this is horrible and verbose.
    // ALSO:
    // TODO: Bugfix: AboutPage bugs out when the app is ran on either lower resolution devices or large font size users.
    // Possible solution: replace fixed size fonts by BoxFit(Text()) widgets.
    return Scaffold(
      appBar: AppBar(),
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
              fontSize: kScreenLargeTextSize * 0.9,
              color: kTextColor,
              shadows: kShadow,
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
              fontSize: kKeyTextSize,
              color: kTextColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 8,
              shadows: kShadow,
            ),
          ),
          const Divider(
            color: kTextColor,
            indent: 100,
            endIndent: 100,
          ),
          const SizedBox(height: 35),
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
                ElevatedButton(
                  style: aboutPageButtonStyle(),
                  onPressed: () => url_launcher.launchUrl(
                      Uri.parse(
                          'https://github.com/lucas-marianno/Math-Expression-Calculator-Flutter'),
                      mode: LaunchMode.externalApplication),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.open_in_new,
                        color: kTextColor,
                      ),
                      Text('Source code for this app'),
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
