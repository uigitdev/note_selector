import 'package:note_selector/note_selector.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: Providers.providersByAccess(ProviderAccess.home),
        child: Consumer<HomeProvider>(
          builder: (context, provider, _) => StreamHolderBuilder<UserModel?>(
            streamHolder: userLocator.userStreamHolder,
            builder: (context, state, userData, error) {
              switch (state) {
                case StreamHolderState.none:
                case StreamHolderState.hasError:
                  return const UnknownPage();
                case StreamHolderState.hasData:
                  return StreamHolderBuilder<HomePageState>(
                    streamHolder: provider.homePageStateStreamHolder,
                    builder: (context, state, pageData, _) {
                      switch (state) {
                        case StreamHolderState.none:
                        case StreamHolderState.hasError:
                          return const UnknownPage();
                        case StreamHolderState.hasData:
                          return Scaffold(
                            appBar: MAppBar(title: userData!.username),
                            body: _homePageContentLoader(pageData!),
                            floatingActionButton: _noteSyncFab(),
                            bottomNavigationBar: BottomNavigationBar(
                              selectedItemColor: MTheme.accent,
                              currentIndex: provider.getCurrentIndexByPageState(pageData),
                              onTap: (index) => provider.selectPageStateByIndex(index),
                              items: _bottomNavigationItems(),
                            ),
                          );
                      }
                    },
                  );
              }
            },
          ),
        ),
      );

  BottomNavigationBarItem _bottomNavigationItem(String label, {required IconData defaultIcon}) => BottomNavigationBarItem(
        icon: Icon(defaultIcon),
        label: label,
      );

  List<BottomNavigationBarItem> _bottomNavigationItems() => [
        _bottomNavigationItem(Textbook.homeNavigationNote, defaultIcon: MIcons.homeNavigationNoteDefault),
        _bottomNavigationItem(Textbook.homeNavigationProfile, defaultIcon: MIcons.homeNavigationProfileDefault),
      ];

  Widget _homePageContentLoader(HomePageState pageState) {
    switch (pageState) {
      case HomePageState.notes:
        return const HomeNotesContent();
      case HomePageState.profile:
        return const HomeProfileContent();
    }
  }

  Widget _noteSyncFab() => IgnorePointer(
        child: Consumer<NoteProvider>(
          builder: (context, provider, _) => StreamHolderBuilder<bool>(
            streamHolder: provider.noteSyncStreamHolder,
            builder: (context, state, isSync, error) {
              switch (state) {
                case StreamHolderState.none:
                  return const SizedBox();
                case StreamHolderState.hasError:
                  return FloatingActionButton(
                    backgroundColor: MTheme.error,
                    onPressed: () {},
                    child: const Icon(MIcons.error),
                  );
                case StreamHolderState.hasData:
                  if (isSync!) {
                    return FloatingActionButton(
                      backgroundColor: MTheme.fab,
                      onPressed: () {},
                      child: const SizedBox(
                        width: Dimens.buttonProgressHeight,
                        height: Dimens.buttonProgressHeight,
                        child: CircularProgressIndicator(
                          color: MTheme.accent,
                          strokeWidth: 3,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
              }
            },
          ),
        ),
      );
}
