import 'package:note_selector/note_selector.dart';

enum HomePageState { notes, profile }

class HomeProvider extends ChangeNotifier {
  final homePageStateStreamHolder = StreamHolder<HomePageState>(HomePageState.notes);

  int getCurrentIndexByPageState(HomePageState pageState) => HomePageState.values.indexWhere(
        (item) => item.name.toLowerCase() == pageState.name.toLowerCase(),
      );

  void selectPageStateByIndex(int index) => homePageStateStreamHolder.addData(
        HomePageState.values[index],
      );
}
