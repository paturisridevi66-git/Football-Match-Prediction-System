import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import the main file so we can test MatchCard
// (We will put the MatchCard in a shared place later)

void main() {
  testWidgets('MatchCard displays correct teams and score', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MatchCard(
            homeTeam: "Man United",
            awayTeam: "Liverpool",
            homeScore: 2,
            awayScore: 1,
          ),
        ),
      ),
    );

    // Check if the texts are present
    expect(find.text("Man United vs Liverpool"), findsOneWidget);
    expect(find.text("2 - 1"), findsOneWidget);
    expect(find.text("Full Time"), findsOneWidget);
  });
}

// Temporary MatchCard for testing (same as in main.dart)
class MatchCard extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;

  const MatchCard({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$homeTeam vs $awayTeam",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            "$homeScore - $awayScore",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text("Full Time", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}