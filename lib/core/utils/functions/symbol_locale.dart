const _symbolMap = {
  '%': '\u066A',
  '.': '\u066B',
  ',': '\u066C',
  '\'': '\u066D',
  '-': '\u066E',
};

///This function takes symbol localize it
/// * [symbol] to be formatted
String symbolLocale(String symbol) {
  return _symbolMap[symbol] ?? symbol;
}
