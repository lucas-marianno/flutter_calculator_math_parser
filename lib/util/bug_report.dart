import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

Future<void> reportError(String? error, BuildContext context) async {
  if (error == null) return;
  // error = error ?? 'test error message';

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error report'),
      content: const Text('Report via e-mail or open an issue at GitHub?',
          textAlign: TextAlign.justify, style: TextStyle(fontSize: 16)),
      actions: [
        TextButton(
          onPressed: () => reportViaEmail(error),
          child: const Text('E-Mail'),
        ),
        TextButton(
          onPressed: () {
            reportErrorToGitHub(error);
          },
          child: const Text('Open issue at GitHub'),
        ),
      ],
    ),
  );
}

void reportViaEmail(String error) {
  String body = 'An error has been found while using the app\n\n $error';
  url_launcher.launchUrl(
    Uri(
      scheme: 'mailto',
      path: 'lucas.marianno94@gmail.com',
      queryParameters: {'subject': 'Calculator - Math Parser | in app Bug Report!', 'body': body},
    ),
  );
}

Future<void> reportErrorToGitHub(String error) async {
  const String repoOwner = 'lucas-marianno';
  const String repoName = 'flutter_calculator_math_parser';
  const String issueTitle = 'Calculator - Math Parser | in app Bug Report!';
  //replace with token
  const String githubToken = 'invalidtoken';

  const String url = 'https://api.github.com/repos/$repoOwner/$repoName/issues';

  final Map<String, dynamic> issue = {
    'title': issueTitle,
    'body': error,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Authorization': 'token $githubToken',
      'Accept': 'application/vnd.github.v3+json',
      'Content-Type': 'application/json',
    },
    body: json.encode(issue),
  );

  if (response.statusCode == 201) {
    print('Issue created successfully.');
  } else {
    print('Failed to create issue: ${response.statusCode} - ${response.body}');
  }
}
