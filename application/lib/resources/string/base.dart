enum Language {
  english,
  french;
}

/// Base class for any String resources
///
/// Allows conversion between different implementations of
/// String resources, such as for different languages.
abstract class LanguageSupport<T> {
  static Language _language = Language.english;

  static void _setLanguage(Language language) {
    LanguageSupport._language = language;
  }

  static Language getLanguage() {
    return LanguageSupport._language;
  }

  // final T _instance;
}

class _Example extends LanguageSupport<_Example> {
  /// These can be created from a formatted file
  static final _Example _english = _Example._internal(
    "First",
    "Second",
    "Third",
  );
  static final _Example _default = _Example._internal(
    "One",
    "Two",
    "Three",
  );

  final String first;
  final String second;
  final String third;

  _Example._internal(this.first, this.second, this.third);

  factory _Example() {
    switch (LanguageSupport.getLanguage()) {
      case Language.english:
        return _english;
      default:
        return _default;
    }
  }
}

void main() {
  LanguageSupport._setLanguage(Language.english);
  print(_Example().first);
  print(_Example().second);
  print(_Example().third);
}
