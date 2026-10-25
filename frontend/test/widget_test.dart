import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/core/constants/app_constants.dart';

void main() {
  testWidgets('home page loads with site chrome', (tester) async {
    await tester.pumpWidget(ThinkTrekApp());
    await tester.pumpAndSettle();

    expect(find.text(AppConstants.appName), findsWidgets);
    expect(find.textContaining('Temporary homepage'), findsOneWidget);
  });

  testWidgets('navigates from home to about', (tester) async {
    await tester.pumpWidget(ThinkTrekApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();

    expect(
      find.textContaining('Company story and team content'),
      findsOneWidget,
    );
  });
}
