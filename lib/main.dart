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
      // ========== THEME ==========
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[700],
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[700],
          centerTitle: true,
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: const HomeScreen(),
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
        title: const Text("Custom Widgets & Themes"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          // Using our Custom Widget
          CustomMatchCard(
            homeTeam: "Man United",
            awayTeam: "Liverpool",
            homeScore: 2,
            awayScore: 1,
            league: "Premier League",
          ),
          SizedBox(height: 16),
          CustomMatchCard(
            homeTeam: "Arsenal",
            awayTeam: "Chelsea",
            homeScore: 1,
            awayScore: 1,
            league: "Premier League",
          ),
          SizedBox(height: 16),
          CustomMatchCard(
            homeTeam: "Barcelona",
            awayTeam: "Real Madrid",
            homeScore: 3,
            awayScore: 2,
            league: "La Liga",
          ),
        ],
      ),
    );
  }
}

// ==================== CUSTOM WIDGET ====================
class CustomMatchCard extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String league;

  const CustomMatchCard({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.league,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // League
          Text(
            league,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),

          // Teams and Score
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home Team
              Expanded(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.green[100],
                      child: Text(
                        homeTeam.substring(0, 2).toUpperCase(),
                        style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      homeTeam,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),

              // Score
              Column(
                children: [
                  Text(
                    "$homeScore - $awayScore",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "FT",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),

              // Away Team
              Expanded(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.blue[100],
                      child: Text(
                        awayTeam.substring(0, 2).toUpperCase(),
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      awayTeam,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}