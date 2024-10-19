import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:technoprise/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Technoprise App Integration Tests', () {
    testWidgets('Add new item', (WidgetTester tester) async {
      // Launch the app
      await tester.pumpWidget(const Technoprise());

      // Navigate to Add Item screen
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Add item title and description
      await tester.enterText(
          find.byKey(const ValueKey('titleField')), 'New Item');
      await tester.enterText(find.byKey(const ValueKey('descriptionField')),
          'This is a new item description.');

      // Tap Add Item button
      await tester.tap(find.byKey(const ValueKey('addItemButton')));
      await tester.pumpAndSettle();

      // Verify that the new item appears in the list
      expect(find.text('New Item'), findsOneWidget);
      expect(find.text('This is a new item description.'), findsOneWidget);
    });

    testWidgets('Delete existing item', (WidgetTester tester) async {
      // Launch the app
      await tester.pumpWidget(const Technoprise());

      // Ensure that at least one item exists to delete
      expect(find.text('Rainforest Ecosystems'), findsOneWidget);

      // Tap delete icon on the first item
      await tester.tap(find.byIcon(Icons.delete_outlined).first);
      await tester.pumpAndSettle();

      // Verify that the item is removed from the list
      expect(find.text('Rainforest Ecosystems'), findsNothing);
    });
  });
}
