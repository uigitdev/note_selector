import 'package:note_selector/note_selector.dart';

enum ProviderAccess {
  auth,
}

class Providers {
  Providers._();

  static List<SingleChildWidget> providersByAccess(ProviderAccess access) {
    final providers = <SingleChildWidget>[];
    switch (access) {
      case ProviderAccess.auth:
        providers.add(ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()));
        break;
    }

    assert(providers.isNotEmpty, "'${access.name}' case does not contains providers.".toUpperCase());
    return providers;
  }
}
