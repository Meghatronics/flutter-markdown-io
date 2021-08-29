import 'package:flutter/material.dart';

import '../markdown_io.dart';
import 'format_markdown.dart';
import 'markdown_io_text_input.dart';
import 'markdown_io_text_toolbar.dart';

///
class MarkdownIo extends StatelessWidget {
  ///
  MarkdownIo({
    Key? key,
    MarkdownIoTextController? controller,
    String? initialData, 
    this.decoration,
    this.style,
    this.styleSheet,
    this.maxLines = 10,
    this.onChanged,
    this.label,
    this.actions = const [
      MarkdownType.bold,
      MarkdownType.italic,
      MarkdownType.title,
      MarkdownType.link,
      MarkdownType.list
    ],
  })  : _controller = controller ?? MarkdownIoTextController(text: initialData),
        super(key: key);

  final MarkdownIoTextController _controller;

  ///
  final Decoration? decoration;

  ///
  final MarkdownStyleSheet? styleSheet;

  ///
  final TextStyle? style;

  ///
  final List<MarkdownType> actions;

  ///
  final int maxLines;

  ///
  final ValueChanged<String>? onChanged;

  ///
  final String? label;

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
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: 320),
        child: DecoratedBox(
          decoration: decoration ?? BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle:
                    /* Theme.of(context).textTheme.headline4 ?? */ _labelStyle,
                unselectedLabelStyle:
                    /* Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w300) ?? */
                    _unselectedLabelStyle,
                tabs: [
                  Text('Edit'),
                  Text('Preview'),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MarkdownIoTextToolbar(controller: _controller),
                      Expanded(
                        child: MarkdownIoTextInput(
                          controller: _controller,
                          onTextChanged: onChanged,
                          style: style,
                          decoration: InputDecoration(
                            labelText: label,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          maxLines: maxLines,
                          actions: actions,
                        ),
                      ),
                    ],
                  ),
                  MarkdownIoTextPreview(
                    controller: _controller,
                    styleSheet: styleSheet,
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
