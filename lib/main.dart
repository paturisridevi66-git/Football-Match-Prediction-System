import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PredictionProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

// ==================== PROVIDER (State Management) ====================
class PredictionProvider extends ChangeNotifier {
  int _predictionCount = 0;
  bool _isDarkMode = false;

  int get predictionCount => _predictionCount;
  bool get isDarkMode => _isDarkMode;

  void increasePrediction() {
    _predictionCount++;
    notifyListeners(); // Important! Updates the UI
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

// ==================== HOME SCREEN ====================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch the provider
    final provider = Provider.of<PredictionProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDarkMode ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        title: const Text("State Management - Exp 05"),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: Icon(provider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              provider.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Predictions Made",
              style: TextStyle(
                fontSize: 22,
                color: provider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${provider.predictionCount}",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: provider.isDarkMode ? Colors.greenAccent : Colors.green[700],
              ),
            ),
            const SizedBox(height: 30),

            // setState example button
            const CounterButton(),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              ),
              onPressed: () {
                provider.increasePrediction();
              },
              child: const Text(
                "Make Prediction (Provider)",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== setState EXAMPLE ====================
class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int localCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Local Counter (setState): $localCount",
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              localCount++;
            });
          },
          child: const Text("Increase Local Counter"),
        ),
      ],
    );
  }
}