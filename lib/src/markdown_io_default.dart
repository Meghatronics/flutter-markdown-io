import 'package:flutter/material.dart';

import '../markdown_io.dart';
import 'markdown_io_text_input.dart';
import 'markdown_io_text_toolbar.dart';
///
class MarkdownIo extends StatelessWidget {
  ///
  MarkdownIo({Key? key, MarkdownIoTextController? controller})
      : _controller = controller ?? MarkdownIoTextController(),
        super(key: key);

  final MarkdownIoTextController _controller;

  static const _labelStyle = TextStyle(
    color: Color(0xFF333333),
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const _unselectedLabelStyle = TextStyle(
    color: Color(0xFFB2B2B2),
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: Theme.of(context).textTheme.headline4 ?? _labelStyle,
            unselectedLabelStyle: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.w300) ??
                _unselectedLabelStyle,
            tabs: [
              Text('Edit'),
              Text('Preview'),
            ],
          ),
          TabBarView(children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarkdownIoTextToolbar(controller: _controller),
                MarkdownIoTextInput(controller: _controller),
              ],
            ),
            MarkdownIoTextPreview(controller: _controller),
          ])
        ],
      ),
    );
  }
}
