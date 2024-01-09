import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RaywenderlichStack extends StatefulWidget {
  final Completer<WebViewController> controller;

  const RaywenderlichStack({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<RaywenderlichStack> createState() => _RaywenderlichStack();
}

class _RaywenderlichStack extends State<RaywenderlichStack> {
  var percentageProgress = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: 'https://github.com/yuzalsif',
          onPageStarted: (url) {
            setState(() {
              percentageProgress = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              percentageProgress = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              percentageProgress = 100;
            });
          },
          navigationDelegate: (navigation) {
            final host = Uri.parse(navigation.url).host;
            if (host.contains('instagram.com')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Blocking navigation to $host',
                  ),
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController) {
            widget.controller.complete(WebViewController);
          },
        ),
        if (percentageProgress < 100)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
