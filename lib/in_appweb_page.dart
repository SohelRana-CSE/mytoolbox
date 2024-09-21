import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppwebPage extends StatefulWidget {
  const InAppwebPage({super.key});

  @override
  State<InAppwebPage> createState() => _InAppwebPageState();
}

class _InAppwebPageState extends State<InAppwebPage> {
  late InAppWebViewController webView;
  double _progress = 0;
  String url = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                  url: WebUri('https://pub.dev/'),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (controller, url) {},
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          _progress < 1
              ? SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.orange.withOpacity(0.2),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
