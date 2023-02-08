import 'package:note_selector/note_selector.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: MAppBar(title: Textbook.unknownTitle),
        body: Center(
          child: Text(Textbook.unknownTitle),
        ),
      );
}
