import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:url_launcher/url_launcher_string.dart';

class MdReader extends StatelessWidget {
  const MdReader(this.mdPath, {super.key});
  final String mdPath;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString(mdPath),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            selectable: true,
            data: snapshot.data!,
            controller: ScrollController(),
            imageBuilder: (uri, title, alt) {
              return Image.asset(uri.toString());
            },
            styleSheet: MarkdownStyleSheet(
                blockSpacing: 12,
                textScaler: const TextScaler.linear(1.15),
                checkbox: TextStyle(color: Colors.blue[700])),
            onTapText: () {},
            onTapLink: (text, href, title) {
              url_launcher.launchUrl(Uri.parse(href!), mode: LaunchMode.externalApplication);
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
