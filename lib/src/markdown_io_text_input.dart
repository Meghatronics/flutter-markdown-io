import 'package:flutter/material.dart';

import 'format_markdown.dart';
import 'markdown_io_text_controller.dart';

/// Widget with markdown buttons
class MarkdownIoTextInput extends StatelessWidget {
  /// Callback called when text changed
  final ValueChanged<String>? onTextChanged;

  /// Text Controller to be used in the widget;
  final MarkdownIoTextController controller;

  /// Decoration for the formField
  final InputDecoration? decoration;

  /// style for the TextFormField
  final TextStyle? style;

  /// Validator for the TextFormField
  final String? Function(String? value)? validator;

  /// String displayed at hintText in TextFormField
  final String? label;

  /// Change the text direction of the input (RTL / LTR)
  final TextDirection? textDirection;

  /// The maximum of lines that can be display in the input
  final int? maxLines;

  /// List of action the component can handle
  final List<MarkdownType> actions;

  /// Constructor for [MarkdownTextInput]
  MarkdownIoTextInput({
    required this.controller,
    // this.initialValue,
    this.onTextChanged,
    this.label = '',
    this.decoration,
    this.validator,
    this.style,
    this.textDirection = TextDirection.ltr,
    this.maxLines = 10,
    this.actions = const [
      MarkdownType.bold,
      MarkdownType.italic,
      MarkdownType.title,
      MarkdownType.link,
      MarkdownType.list
    ],
  }) : assert(
          (label != null) && (decoration != null),
          'Cannot provide both [label] and [decoration].'
          ' [label] is only a convenient way of setting the hintText in [decoration]',
        );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      onChanged: onTextChanged,
      textDirection: textDirection,
      style: style ??
          TextStyle(
            color: Theme.of(context).accentColor,
          ),
      decoration: decoration ?? _defaultDecoration(context),
      textInputAction: TextInputAction.newline,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  InputDecoration _defaultDecoration(BuildContext context) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor)),
      hintText: label,
      hintStyle: const TextStyle(color: Color.fromRGBO(63, 61, 86, 0.5)),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    );
  }
}
