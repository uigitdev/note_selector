import 'package:note_selector/note_selector.dart';

enum ProviderAccess { auth, home, friendNote }

class Providers {
  Providers._();

  static List<SingleChildWidget> providersByAccess(ProviderAccess access) {
    final providers = <SingleChildWidget>[];
    switch (access) {
      case ProviderAccess.auth:
        providers.add(ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()));
        break;
      case ProviderAccess.home:
        providers.add(ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()));
        providers.add(ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()));
        providers.add(ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()));
        providers.add(ChangeNotifierProvider<FriendProvider>(create: (_) => FriendProvider()));
        break;

      ///Added to [FriendBottomSheetItemContent] class.
      ///In that case only [friendNoteListStreamHolder] will be available in the provider.
      case ProviderAccess.friendNote:
        providers.add(ChangeNotifierProvider<FriendProvider>(create: (_) => FriendProvider()));
        break;
    }

    assert(providers.isNotEmpty, "'${access.name}' case does not contains providers.".toUpperCase());
    return providers;
  }
}
