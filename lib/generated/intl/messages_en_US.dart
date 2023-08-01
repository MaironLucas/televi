// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "favoritesAppBar": MessageLookupByLibrary.simpleMessage("Favorites"),
        "favoritesMessage": MessageLookupByLibrary.simpleMessage(
            "Nothing to see here, try adding some movies to your favorites list!"),
        "grade": MessageLookupByLibrary.simpleMessage("Grade"),
        "homePageTitle": MessageLookupByLibrary.simpleMessage("My Film List"),
        "responseError": MessageLookupByLibrary.simpleMessage(
            "An error occured, failure to process information!"),
        "snackbarFavoriteChangeError": MessageLookupByLibrary.simpleMessage(
            "An error occured on favorite/unfavorite!"),
        "snackbarFavoriteFetchError": MessageLookupByLibrary.simpleMessage(
            "An error occured on loading favorite status!"),
        "snackbarFavoriteSuccess":
            MessageLookupByLibrary.simpleMessage("Added to favorites list!"),
        "snackbarUnFavoriteSuccess": MessageLookupByLibrary.simpleMessage(
            "Removed from favorites list!"),
        "tabBarFavorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "tabBarMovies": MessageLookupByLibrary.simpleMessage("Movies"),
        "timeoutError": MessageLookupByLibrary.simpleMessage(
            "Communication failure with the server, check your network connection!"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
        "unknowError": MessageLookupByLibrary.simpleMessage(
            "An unknown failure has occurred!")
      };
}
