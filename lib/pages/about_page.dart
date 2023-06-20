import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ReadmeMD(),
      ),
    );
  }
}

class ReadmeMD extends StatelessWidget {
  const ReadmeMD({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString('assets/readme.md'),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            selectable: true,
            data: snapshot.data!,
            controller: ScrollController(),
            styleSheet: MarkdownStyleSheet(
              blockSpacing: 12,
              textScaleFactor: 1.15,
            ),
            onTapText: () {},
            onTapLink: (text, href, title) {
              url_launcher.launchUrl(
                Uri.parse(href!),
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
