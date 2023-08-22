library global;
import 'package:application/resources/string/base.dart';
import 'package:xml/xml.dart';

class NestedStrings {
    var _subfolders = new Map<String, NestedStrings>();
    var _strings = new Map<String, String>();

    void setString(String path, String value) {
        // Split the input on slashes
        final path_split = path.split("/");
        if (path_split.length == 1) {
            _strings[path_split[0]] = value;
        }
        else if (path_split.length > 1) {
            _subfolders ??= new Map<String, NestedStrings>();
            _subfolders[path_split[0]] ??= new NestedStrings();
            _subfolders[path_split[0]]!.setString(path_split.sublist(1).join("/"), value);
        }
        else {
            return;
        }
    }
    
    String getString(String label) {
        return _strings[label] ?? "error";
    }

}



LanguageSupport<NestedStrings> generate_languages() {

    var temp_map = new Map<Language, NestedStrings>();

    // Create all of our maps from the xml.
    for (var language in Language.values) {
        var strings = new NestedStrings();
        // Generate strings from the xml
        temp_map[language] = strings;
    }

    // Instantiate the language objects
    return LanguageSupport(temp_map, temp_map[Language.english] ??
            new NestedStrings());
}


LanguageSupport<NestedStrings> instructions = generate_languages();
