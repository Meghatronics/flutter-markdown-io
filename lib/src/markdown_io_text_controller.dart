import 'package:flutter/cupertino.dart';

import 'format_markdown.dart';

///
class MarkdownIoTextController extends TextEditingController {
  // ignore: public_member_api_docs
  MarkdownIoTextController({String? text}) : super(text: text);

  void _onTap(MarkdownType type, {int titleSize = 1}) {
    final textSelection = selection;
    final basePosition = textSelection.baseOffset;
    var noTextSelected =
        (textSelection.baseOffset - textSelection.extentOffset) == 0;

    final result = FormatMarkdown.convertToMarkdown(
        type, text, textSelection.baseOffset, textSelection.extentOffset,
        titleSize: titleSize);

    value = value.copyWith(
        text: result.data,
        selection:
            TextSelection.collapsed(offset: basePosition + result.cursorIndex));

    if (noTextSelected) {
      selection = TextSelection.collapsed(
          offset: selection.end - result.replaceCursorIndex);
    }
  }

  /// Format selection to this markdown type
  void formatSelection(MarkdownType type) => _onTap(type);

  /// Format selection to Title markdown.
  void formatToTitle({required int titleSize}) {
    assert(titleSize > 0 && titleSize < 10);
    _onTap(MarkdownType.title, titleSize: titleSize);
  }
}
