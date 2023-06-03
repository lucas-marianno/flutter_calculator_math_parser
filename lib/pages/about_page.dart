import 'package:calculator2/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Readability: rewrite AboutPage, this is horrible and verbose.

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              flex: 2,
              child: FittedBox(
                child: CircleAvatar(
                  foregroundImage: AssetImage("assets/avatar.png"),
                ),
              ),
            ),
            Expanded(
              child: FittedBox(
                  child: Text(
                'Lucas Marianno'.toUpperCase(),
              )),
            ),
            const Divider(),
            Expanded(
              child: FittedBox(
                child: Text(
                  'flutter developer'.toUpperCase(),
                  style: GoogleFonts.fjallaOne(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8,
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AboutPageButton(
                    onTap: () => url_launcher.launchUrl(
                      Uri(scheme: 'tel', path: '+55(11)99999-9999'),
                    ),
                    iconData: Icons.phone,
                    label: '+55 (11) 99999-9999',
                  ),
                  AboutPageButton(
                    onTap: () => url_launcher.launchUrl(
                      Uri.parse('https://github.com/lucas-marianno'),
                      mode: LaunchMode.externalApplication,
                    ),
                    iconData: Icons.open_in_new,
                    label: 'GitHub/lucas-marianno',
                  ),
                  AboutPageButton(
                    onTap: () => url_launcher.launchUrl(
                      Uri(scheme: 'mailto', path: 'lucas.pk16@outlook.com'),
                      //mode: LaunchMode.externalApplication,
                    ),
                    iconData: Icons.email,
                    label: 'lucas.pk16@outlook.com',
                  ),
                  AboutPageButton(
                    onTap: () => url_launcher.launchUrl(
                      Uri.parse(
                          'https://github.com/lucas-marianno/Math-Expression-Calculator-Flutter'),
                      mode: LaunchMode.externalApplication,
                    ),
                    iconData: Icons.open_in_new,
                    label: 'Source code for this app',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPageButton extends StatelessWidget {
  const AboutPageButton({
    required this.onTap,
    required this.iconData,
    required this.label,
    super.key,
  });

  final Function onTap;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(kHighEmphasisButtonColor),
      ),
      onPressed: () => onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: FittedBox(child: Icon(iconData))),
          const Spacer(flex: 2),
          Expanded(
              flex: 10,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 25),
                child: FittedBox(
                  child: Text(
                    label,
                    textScaleFactor: 0.5,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
