import 'package:flutter_test/flutter_test.dart';

import 'package:chimicapp/main.dart';

void main() {
  testWidgets(
    '',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MyApp(),
      );
    },
  );
}
