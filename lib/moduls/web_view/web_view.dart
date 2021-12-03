import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen(this.url);

   final String? url;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }

}