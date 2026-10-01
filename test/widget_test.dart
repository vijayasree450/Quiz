import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/quiz.dart';

void main() {
  testWidgets('Quiz app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Quiz());

    // Verify that start screen displays title and start button.
    expect(find.text('Start Quiz'), findsOneWidget);
    expect(find.text('Learn Flutter the fun way!'), findsOneWidget);
  });
}

