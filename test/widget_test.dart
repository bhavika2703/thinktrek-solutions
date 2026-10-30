import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/features/cms/data/thinktrek_seed.dart';

void main() {
  testWidgets('home page loads with site chrome', (tester) async {
    await _setDesktop(tester);
    await tester.pumpWidget(ThinkTrekApp());
    await tester.pumpAndSettle();

    expect(find.text(ThinktrekSeed.site.brand.name), findsWidgets);
    expect(find.text(ThinktrekSeed.site.brand.tagline), findsWidgets);
    expect(find.text(ThinktrekSeed.site.home.primaryCtaLabel), findsOneWidget);
  });

  testWidgets('navigates from home to about', (tester) async {
    await _setDesktop(tester);
    await tester.pumpWidget(ThinkTrekApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('About').first);
    await tester.pumpAndSettle();

    expect(find.text(ThinktrekSeed.founderName), findsWidgets);
    expect(
      find.textContaining(ThinktrekSeed.site.about.intro.title),
      findsOneWidget,
    );
  });

  testWidgets('opens blog list from navigation', (tester) async {
    await _setDesktop(tester);
    await tester.pumpWidget(ThinkTrekApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Blog').first);
    await tester.pumpAndSettle();

    expect(find.text(ThinktrekSeed.posts.first.title), findsOneWidget);
  });
}

Future<void> _setDesktop(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1440, 1024);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}
