import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MatchListScreen(),
    );
  }
}

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  List<dynamic> matches = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  // ========== FETCH DATA FROM API ==========
  Future<void> fetchMatches() async {
    try {
      // Using a free public API for demo (JSONPlaceholder)
      // In real projects you can use football-data.org (needs API key)
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=6'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Convert the API data into football-style matches for display
        setState(() {
          matches = data.map((item) {
            return {
              'id': item['id'],
              'home': 'Team ${item['id']}',
              'away': 'Opponent ${item['id']}',
              'score': '${item['id'] % 5} - ${(item['id'] + 1) % 4}',
              'title': item['title'],
            };
          }).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Failed to load data";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Error: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API - Exp 09"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                isLoading = true;
                errorMessage = null;
              });
              fetchMatches();
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    final match = matches[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          "${match['home']} vs ${match['away']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Score: ${match['score']}"),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.green[100],
                          child: Text(
                            "${match['id']}",
                            style: TextStyle(color: Colors.green[800]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}