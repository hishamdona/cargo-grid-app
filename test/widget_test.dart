import 'package:flutter_test/flutter_test.dart';
import 'package:cargo_grid/main.dart';

void main() {
  testWidgets('CargoGrid smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CargoGridApp());
  });
}
