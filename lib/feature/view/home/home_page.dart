import 'package:note_selector/note_selector.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamHolderBuilder<UserModel?>(
        streamHolder: userLocator.userStreamHolder,
        builder: (context, state, data, error) {
          switch (state) {
            case StreamHolderState.none:
            case StreamHolderState.hasError:
              return const UnknownPage();
            case StreamHolderState.hasData:
              return Scaffold(
                appBar: MAppBar(title: data!.username),
                body: const Center(
                  child: Text('Home Page'),
                ),
              );
          }
        },
      );
}
