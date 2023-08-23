# Localisation
We can use the [easy_localization](https://pub.dev/packages/easy_localization) plugin to help us translate our app into different languages. This plugin seems slightly easier to use than the [in-built](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization) Flutter support for localisation.

## Add new language
In order to add a new language, you must:
1. Create a new JSON file for its translations in `assets/translations`. E.g. `assets/translations/es.json` for Spanish.
2. For iOS, you must add e.g. `<string>es</string>` to `application/ios/Runner/Info.plist` in the `CFBundleLocalizations` section.
3. Copy the English JSON into ChatGPT, and ask for the *values* to be translated into your desired language. Copy and paste the result into your new JSON file.

## In our code
To use these translations in our code, you must refer to any translatable string by its *key* in the JSON file. E.g. to translate Tutorial 2's "Scrolling" module name into any language, we do `'tutorial2_scrolling'.tr()`, where the JSON file contains

```
{
    ...
     "tutorial2_scrolling": "Scrolling",
    ...
}
```

This JSON should obviously be repeated for all supported languages. If you don't provide a translation for a particular entry, it will default to English.

## Testing a language
The best way to do this is probably to change the language of your test device. E.g. in Android, go to Settings and change the System Language, then rerun the app and you should see strings translated into that language.