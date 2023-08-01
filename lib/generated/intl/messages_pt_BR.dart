// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
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
  String get localeName => 'pt_BR';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "favoritesAppBar": MessageLookupByLibrary.simpleMessage("Favoritos"),
        "favoritesMessage": MessageLookupByLibrary.simpleMessage(
            "Nada para ver por aqui, tente adicionar alguns filmes a sua lista de favoritos!"),
        "grade": MessageLookupByLibrary.simpleMessage("Nota"),
        "homePageTitle":
            MessageLookupByLibrary.simpleMessage("Lista de filmes"),
        "responseError": MessageLookupByLibrary.simpleMessage(
            "Ocorreu um erro no servidor, falha ao processar informações!"),
        "snackbarFavoriteChangeError": MessageLookupByLibrary.simpleMessage(
            "Ocorreu um erro ao favoritar/desfavoritar"),
        "snackbarFavoriteFetchError": MessageLookupByLibrary.simpleMessage(
            "Ocorreu um erro ao carregar status de favorito!"),
        "snackbarFavoriteSuccess": MessageLookupByLibrary.simpleMessage(
            "Adicionado a lista de favoritos!"),
        "snackbarUnFavoriteSuccess": MessageLookupByLibrary.simpleMessage(
            "Removido da lista de favoritos!"),
        "tabBarFavorites": MessageLookupByLibrary.simpleMessage("Favoritos"),
        "tabBarMovies": MessageLookupByLibrary.simpleMessage("Filmes"),
        "timeoutError": MessageLookupByLibrary.simpleMessage(
            "Falha de comunicação com o servidor, verifique sua conexão!"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Tentar Novamente"),
        "unknowError": MessageLookupByLibrary.simpleMessage(
            "Ocorreu uma falha desconhecida!")
      };
}
