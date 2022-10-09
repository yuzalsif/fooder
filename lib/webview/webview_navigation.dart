import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNavigation extends StatelessWidget {
  final Completer<WebViewController> controller;
  const WebViewNavigation({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.future,
      builder: (context, AsyncSnapshot<WebViewController> snapshot) {
        final WebViewController? controller = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done ||
            controller == null) {
          return Row(
            children: const [
              Icon(FontAwesomeIcons.arrowLeft),
              Icon(FontAwesomeIcons.arrowRight),
              Icon(FontAwesomeIcons.repeat),
            ],
          );
        }
        return Row(
          children: [
            IconButton(
              onPressed: () async {
                if (await controller.canGoBack()) {
                  await controller.goBack();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sorry! No back item history'),
                    ),
                  );
                  return;
                }
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft),
            ),
            IconButton(
              onPressed: () async {
                if (await controller.canGoForward()) {
                  await controller.goForward();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sorry! No forward history item'),
                    ),
                  );
                  return;
                }
              },
              icon: const Icon(FontAwesomeIcons.arrowRight),
            ),
            IconButton(
              onPressed: () async {
                await controller.reload();
              },
              icon: const Icon(FontAwesomeIcons.repeat),
            ),
          ],
        );
      },
    );
  }
}
