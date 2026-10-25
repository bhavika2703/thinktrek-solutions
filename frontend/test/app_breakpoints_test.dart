import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/responsive/app_breakpoints.dart';

void main() {
  test('maps viewport widths to compact, medium and expanded', () {
    expect(AppBreakpoints.fromWidth(375), AppWindowSize.compact);
    expect(AppBreakpoints.fromWidth(599), AppWindowSize.compact);
    expect(AppBreakpoints.fromWidth(600), AppWindowSize.medium);
    expect(AppBreakpoints.fromWidth(1023), AppWindowSize.medium);
    expect(AppBreakpoints.fromWidth(1024), AppWindowSize.expanded);
    expect(AppBreakpoints.fromWidth(1440), AppWindowSize.expanded);
  });
}
