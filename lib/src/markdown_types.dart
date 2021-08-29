
/// Represent markdown possible type to convert
enum MarkdownType {
  /// For **bold** text
  bold,

  /// For _italic_ text
  italic,

  /// For ~~strikethrough~~ text
  strikethrough,

  /// For [link](https://flutter.dev)
  link,

  /// For # Title or ## Title or ### Title
  title,

  /// For :
  ///   * Item 1
  ///   * Item 2
  ///   * Item 3
  list,

  /// For ```code``` text
  code,

  /// For :
  ///   > Item 1
  ///   > Item 2
  ///   > Item 3
  blockquote,

  /// For adding ------
  separator,

  /// For ![Alt text](link)
  image,
}