import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
    
      ..loadRequest(Uri.parse('https://events.inspirefunclub.com/'));
  }

  @override
  Widget build(BuildContext context) {
    // ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ..setNavigationDelegate(
    //   NavigationDelegate(
    //     onProgress: (int progress) {
    //       // Update loading bar.
    //     },
    //     onPageStarted: (String url) {},
    //     onPageFinished: (String url) {},
    //     onWebResourceError: (WebResourceError error) {},
    //     onNavigationRequest: (NavigationRequest request) {
    //       if (request.url.startsWith('https://www.youtube.com/')) {
    //         return NavigationDecision.prevent;
    //       }
    //       return NavigationDecision.navigate;
    //     },
    //   ),
    // )
    // ..loadRequest(Uri.parse('https://events.inspirefunclub.com/'));
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
