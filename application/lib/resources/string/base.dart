/// Supported languages across the application
enum Language {
  unset,
  english,
  french,
  spanish;
}

/// Wrapper for resources that are language dependent.
///
/// Allows conversion between different implementations of
/// resources for different languages.
class LanguageSupport<T> {
  static Language _language = Language.english;

  static void setLanguage(Language language) {
    LanguageSupport._language = language;
  }

  static Language getLanguage() {
    return LanguageSupport._language;
  }

  final Map<Language, T> _instances;
  final T _default;

  const LanguageSupport(this._instances, this._default);

  T getInstance() {
    return _instances[LanguageSupport.getLanguage()] ?? this._default;
  }
}

/// Examples
//
// /// Instantiating an instance for a class of strings
// const LanguageSupport<_Example> _exampleStrings =
//     LanguageSupport(_Example.instances, _Example.english2);
//
// /// Class used as an object enum for strings
// class _Example {
//   /// These can be created from a formatted file
//   static const _Example english = _Example._internal(
//     "First",
//     "Second",
//     "Third",
//   );
//   static const _Example english2 = _Example._internal(
//     "One",
//     "Two",
//     "Three",
//   );
//   static const _Example french = _Example._internal(
//     "1",
//     "2",
//     "3",
//   );
//
//   /// Instances of this class that can be switched between
//   static const Map<Language, _Example> instances = {
//     Language.english: _Example.english,
//     Language.french: _Example.french,
//   };
//
//   final String first;
//   final String second;
//   final String third;
//
//   const _Example._internal(this.first, this.second, this.third);
// }
//
// void main() {
//   // LanguageSupport._setLanguage(Language.english);
//   print(_exampleStrings.getInstance().first);
//   print(_exampleStrings.getInstance().second);
//   print(_exampleStrings.getInstance().third);
//   // LanguageSupport._setLanguage(Language.french);
//   print(_exampleStrings.getInstance().first);
//   print(_exampleStrings.getInstance().second);
//   print(_exampleStrings.getInstance().third);
//   // LanguageSupport._setLanguage(Language.spanish);
//   print(_exampleStrings.getInstance().first);
//   print(_exampleStrings.getInstance().second);
//   print(_exampleStrings.getInstance().third);
// }
