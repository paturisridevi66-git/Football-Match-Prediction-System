import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FootyPredict',
      // Named Routes
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const MatchDetailScreen(),
        '/predict': (context) => const PredictionScreen(),
      },
    );
  }
}

// ==================== HOME SCREEN ====================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Football Matches"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MatchTile(
            home: "Man United",
            away: "Liverpool",
            score: "2 - 1",
            onTap: () {
              Navigator.pushNamed(context, '/details');
            },
          ),
          MatchTile(
            home: "Arsenal",
            away: "Chelsea",
            score: "1 - 1",
            onTap: () {
              Navigator.pushNamed(context, '/details');
            },
          ),
          MatchTile(
            home: "Man City",
            away: "Tottenham",
            score: "3 - 0",
            onTap: () {
              Navigator.pushNamed(context, '/details');
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/predict');
            },
            child: const Text(
              "Make a Prediction",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== MATCH TILE ====================
class MatchTile extends StatelessWidget {
  final String home;
  final String away;
  final String score;
  final VoidCallback onTap;

  const MatchTile({
    super.key,
    required this.home,
    required this.away,
    required this.score,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text("$home  vs  $away"),
        subtitle: Text("Score: $score"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

// ==================== MATCH DETAIL SCREEN ====================
class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match Details"),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Manchester United  2 - 1  Liverpool",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text("Old Trafford • Full Time"),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== PREDICTION SCREEN ====================
class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make Prediction"),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Who will win?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Manchester United"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Draw"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Liverpool"),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}