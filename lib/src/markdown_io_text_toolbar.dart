import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'format_markdown.dart';
import 'markdown_io_text_controller.dart';

/// Create a tool bar that formats markdown in a `MarkdownTextInput`.
/// Pass the same TextEditingController into both the toolbar and the input.
class MarkdownIoTextToolbar extends StatelessWidget {
  /// Default Constructor for [MarkdownIoTextToolbar]
  const MarkdownIoTextToolbar({
    Key? key,
    required this.controller,
    this.backgroundColor,
    this.buttonColor,
    this.actions = const [
      MarkdownType.bold,
      MarkdownType.italic,
      MarkdownType.title,
      MarkdownType.link,
      MarkdownType.list
    ],
  }) : super(key: key);

  /// Text Controller to be used to connect to the MarkdownTextInput;
  final MarkdownIoTextController controller;

  ///
  final Color? backgroundColor;

  ///
  final Color? buttonColor;

  ///
  final List<MarkdownType> actions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Material(
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: actions.map((type) {
            return type == MarkdownType.title
                ? ExpandableNotifier(
                    child: Expandable(
                      key: Key('H#_button'),
                      collapsed: ExpandableButton(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'H#',
                              style: TextStyle(
                                  color: buttonColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      expanded: Container(
                        color: Colors.white10,
                        child: Row(
                          children: [
                            for (int i = 1; i <= 6; i++)
                              InkWell(
                                key: Key('H${i}_button'),
                                onTap: () =>
                                    controller.formatToTitle(titleSize: i),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'H$i',
                                    style: TextStyle(
                                        color: buttonColor,
                                        fontSize: (18 - i).toDouble(),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ExpandableButton(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    key: Key(type.key),
                    onTap: () => controller.formatSelection(type),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        type.icon,
                        color: buttonColor,
                      ),
                    ),
                  );
          }).toList(),
        ),
      ),
    );
  }
}
