import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewAllNews extends StatelessWidget {
  final String url;

  WebViewAllNews({required this.url, required Articles articles});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView News"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _launchURL(url);
          },
          child: Text("Open in Browser"),
        ),
      ),
    );
  }
}
