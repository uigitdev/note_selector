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
}
