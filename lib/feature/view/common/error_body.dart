import 'package:note_selector/note_selector.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Textbook.globalErrorInfo,
        textAlign: TextAlign.center,
        style: MTextStyle.smallInfo,
      ),
    );
  }
}
