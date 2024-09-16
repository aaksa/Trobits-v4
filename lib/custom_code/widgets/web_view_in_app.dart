// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewInApp extends StatefulWidget {
  const WebViewInApp(
      {required this.width, required this.height, required this.news});

  final double width;
  final double height;
  final String news;

  @override
  State<WebViewInApp> createState() => _WebViewInAppState();
}

class _WebViewInAppState extends State<WebViewInApp> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      disableDefaultErrorPage: true,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: <Widget>[
      // TextField(
      //   decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
      //   controller: urlController,
      //   keyboardType: TextInputType.url,
      //   onSubmitted: (value) {
      //     var url = WebUri(value);
      //     if (url.scheme.isEmpty) {
      //       url = WebUri("https://www.google.com/search?q=$value");
      //     }
      //     webViewController?.loadUrl(urlRequest: URLRequest(url: url));
      //   },
      // ),

      Expanded(
        child: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                url: WebUri(widget.news),
                headers: {
                  // Replace with actual CORS headers
                  'Origin': widget.news,
                  'Access-Control-Allow-Origin': '*',
                  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
                  'Access-Control-Allow-Headers':
                      'Origin, Content-Type, Accept',
                  // Add other headers as needed
                },
              ),
              initialSettings: settings,
              pullToRefreshController: pullToRefreshController,
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onLoadStart: (controller, url) {
                setState(() {
                  this.url = url.toString();
                  urlController.text = this.url;
                });
              },
              onPermissionRequest: (controller, request) async {
                return PermissionResponse(
                    resources: request.resources,
                    action: PermissionResponseAction.GRANT);
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                var uri = navigationAction.request.url!;

                if (![
                  "http",
                  "https",
                  "file",
                  "chrome",
                  "data",
                  "javascript",
                  "about"
                ].contains(uri.scheme)) {
                  if (await canLaunchUrl(uri)) {
                    // Launch the App
                    await launchUrl(
                      uri,
                    );
                    // and cancel the request
                    return NavigationActionPolicy.CANCEL;
                  }
                }

                return NavigationActionPolicy.ALLOW;
              },
              onLoadStop: (controller, url) async {
                pullToRefreshController?.endRefreshing();
                setState(() {
                  this.url = url.toString();
                  urlController.text = this.url;
                });
              },
              onLoadHttpError: (controller, url, statusCode, description) {
                if (statusCode == 200) {
                  // HTTP 200 OK, handle accordingly
                } else {
                  // Handle other HTTP status codes (e.g., 404, 500, etc.)
                  var uri = url.toString();
                  launchUrl(Uri.parse(
                      uri)); // Example function to launch URL externally
                }
              },
              onReceivedError: (controller, request, error) async {
                print("Error");
                pullToRefreshController?.endRefreshing();
                var uri = request.url!;
                await launchUrl(
                  uri,
                );
              },
              onReceivedHttpError: (controller, request, errorResponse) async {
                var uri = request.url!;
                await launchUrl(
                  uri,
                );
              },
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  pullToRefreshController?.endRefreshing();
                }
                setState(() {
                  this.progress = progress / 100;
                  urlController.text = url;
                });
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) {
                setState(() {
                  this.url = url.toString();
                  urlController.text = this.url;
                });
              },
              onConsoleMessage: (controller, consoleMessage) {
                if (kDebugMode) {
                  print(consoleMessage);
                }
              },
            ),
            progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container(),
          ],
        ),
      ),
    ])));
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
