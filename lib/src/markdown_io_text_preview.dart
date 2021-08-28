import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'markdown_io_text_controller.dart';

///
class MarkdownIoTextPreview extends StatelessWidget {
  ///
  const MarkdownIoTextPreview(
      {Key? key, required this.controller, this.styleSheet})
      : super(key: key);

  ///
  final MarkdownIoTextController controller;

  ///
  final MarkdownStyleSheet? styleSheet;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: controller.text,
      styleSheet: styleSheet,
    );
  }
}
