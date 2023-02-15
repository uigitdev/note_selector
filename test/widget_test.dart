import 'package:flutter_test/flutter_test.dart';
import 'package:note_selector/note_selector.dart';

void main() {
  group('Testing home and friend NoteItem', () {
    final noteModel = NoteModel(userId: 1, id: 1, title: 'Lorem ipsum', completed: true);

    testWidgets('Testing home NoteItem', (tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: Providers.providersByAccess(ProviderAccess.home),
        child: MaterialApp(
          home: Scaffold(
            body: NoteItem(
              noteModel: noteModel,
              position: 0,
            ),
          ),
        ),
      ));

      final idFinder = find.text('${noteModel.id}');
      final titleFinder = find.text(noteModel.title);
      final checkboxFinder = find.byKey(const ValueKey('note_item_checkbox'));
      final checkboxGestureFinder = find.byKey(const ValueKey('note_item_checkbox_tap'));

      expect(idFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
      expect(checkboxFinder, findsOneWidget);
      expect(checkboxGestureFinder, findsOneWidget);

      final checkbox = tester.widget<Checkbox>(checkboxFinder);
      expect(checkbox.value, noteModel.completed);
    });

    testWidgets('Testing friend NoteItem', (tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: Providers.providersByAccess(ProviderAccess.home),
        child: MaterialApp(
          home: Scaffold(
            body: NoteItem(
              noteModel: noteModel,
              position: 0,
              isJustView: true,
            ),
          ),
        ),
      ));

      final completedFinder = find.text(Textbook.completed);
      final checkboxFinder = find.byKey(const ValueKey('note_item_checkbox'));

      expect(completedFinder, findsNothing, reason: 'It should not appear');
      expect(checkboxFinder, findsNothing, reason: 'It should not appear');
    });
  });

  testWidgets('Testing home AppBar', (tester) async {
    final userModel = UserModel(
      username: 'my_username',
      name: 'My Name',
      email: 'myname@email.com',
    );
    userLocator.userStreamHolder.addData(userModel);

    await tester.pumpWidget(MultiProvider(
      providers: Providers.providersByAccess(ProviderAccess.home),
      child: const MaterialApp(
        home: HomePage(),
      ),
    ));

    final usernameFinder = find.text(userModel.username);

    expect(usernameFinder, findsOneWidget);

    final newUserModel = UserModel(
      username: 'my_new_username',
      name: 'My Name',
      email: 'myname@email.com',
    );
    userLocator.userStreamHolder.addData(newUserModel);
    await tester.pump();
    final newUsernameFinder = find.text(newUserModel.username);

    expect(newUsernameFinder, findsOneWidget);
  });
}
