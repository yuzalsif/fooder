import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fooderlich/webview/raywenderlich_stack.dart';
import 'package:fooderlich/webview/webview_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RaywenderlichWebView extends StatefulWidget {
  const RaywenderlichWebView({Key? key}) : super(key: key);

  @override
  State<RaywenderlichWebView> createState() => _RaywenderlichWebViewState();
}

class _RaywenderlichWebViewState extends State<RaywenderlichWebView> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white, backgroundColor: Colors.pink),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Learn More'),
          actions: [
            WebViewNavigation(
              controller: controller,
            ),
          ],
        ),
        body: RaywenderlichStack(
          controller: controller,
        ),
      ),
    );
  }
}
