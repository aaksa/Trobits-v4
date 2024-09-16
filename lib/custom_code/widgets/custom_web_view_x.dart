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

import 'package:url_launcher/url_launcher.dart';

import 'package:webviewx_plus/webviewx_plus.dart';

import 'package:flutter/widgets.dart';

class CustomWebViewX extends StatefulWidget {
  CustomWebViewX(
      {required this.width, required this.height, required this.url});

  final double width;
  final double height;
  final String url;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomWebViewXState();
  }
}

class _CustomWebViewXState extends State<CustomWebViewX> {
  late WebViewXController webviewController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebViewX(
      height: widget.width,
      width: widget.height,
      initialContent: widget.url,
      initialSourceType: SourceType.urlBypass,
      onPageStarted: (com) {
        webviewController.loadContent(widget.url,
            sourceType: SourceType.urlBypass,
            headers: {
              'Access-Control-Allow-Origin':
                  '*', // Replace with your required headers
              'Access-Control-Allow-Methods ': 'GET, POST, OPTIONS',
              'Access-Control-Allow-Headers': '*'
            });
      },
      onPageFinished: (com) {
        webviewController.loadContent(widget.url,
            sourceType: SourceType.urlBypass,
            headers: {
              'Access-Control-Allow-Origin':
                  '*', // Replace with your required headers
              'Access-Control-Allow-Methods ': 'GET, POST, OPTIONS',
              'Access-Control-Allow-Headers': '*'
            });
      },
      onWebResourceError: (_) {
        launchUrl(Uri.parse(widget.url));

        // webviewController.loadContent("https://google.com",
        //     sourceType: SourceType.urlBypass,
        //     headers: {
        //       'Access-Control-Allow-Origin':
        //           '*', // Replace with your required headers
        //     });
      },
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
