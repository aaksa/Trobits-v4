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

import 'package:flutter/widgets.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlText extends StatefulWidget {
  const HtmlText({
    super.key,
    this.width,
    this.height,
    this.htmlText = "Default",
  });

  final double? width;
  final double? height;
  final String htmlText;

  @override
  State<HtmlText> createState() => _HtmlTextState();
}

class _HtmlTextState extends State<HtmlText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              width: widget.width,
              child: HtmlWidget(
                widget.htmlText,
                // textStyle: TextStyle(
                //   fontWeight: FontWeight.w400,
                //   fontFamily: 'Gilroy',
                //   // fontStyle: isItal,
                //   height: widget.textSpacing ?? 1,
                // ),
              ));
        },
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
