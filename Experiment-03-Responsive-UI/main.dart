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
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Responsive Match Card - Exp 03"),
          backgroundColor: Colors.green[700],
          centerTitle: true,
        ),
        body: const ResponsiveMatchScreen(),
      ),
    );
  }
}

class ResponsiveMatchScreen extends StatelessWidget {
  const ResponsiveMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Decide layout based on screen size
    if (screenWidth < 600) {
      // Mobile layout
      return const MobileLayout();
    } else if (screenWidth < 1000) {
      // Tablet layout
      return const TabletLayout();
    } else {
      // Desktop layout
      return const DesktopLayout();
    }
  }
}

// ==================== MOBILE LAYOUT ====================
class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          "Mobile View",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        MatchCard(),
        SizedBox(height: 16),
        MatchCard(),
      ],
    );
  }
}

// ==================== TABLET LAYOUT ====================
class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Tablet View",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: const [
                Expanded(child: MatchCard()),
                SizedBox(width: 20),
                Expanded(child: MatchCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== DESKTOP LAYOUT ====================
class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text(
            "Desktop View",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Row(
              children: const [
                Expanded(child: MatchCard()),
                SizedBox(width: 20),
                Expanded(child: MatchCard()),
                SizedBox(width: 20),
                Expanded(child: MatchCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== MATCH CARD ====================
class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
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
          const Text(
            "Premier League",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home
              Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text("MU", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text("Man Utd", style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              // Score
              const Column(
                children: [
                  Text("2 - 1", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("FT", style: TextStyle(color: Colors.grey)),
                ],
              ),
              // Away
              Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text("LIV", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text("Liverpool", style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}