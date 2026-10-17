// Experiment-01: Dart Basics
// Football Match Prediction System

void main() {
  // 1. Variables
  String teamA = "Manchester United";
  String teamB = "Liverpool";
  int scoreA = 2;
  int scoreB = 1;
  bool isMatchFinished = true;

  print("========== FOOTBALL MATCH ==========");
  print("Match: $teamA vs $teamB");
  print("Score: $scoreA - $scoreB");
  print("Match Finished: $isMatchFinished");
  print("------------------------------------");

  // 2. List
  List<String> upcomingMatches = [
    "Arsenal vs Chelsea",
    "Barcelona vs Real Madrid",
    "Bayern Munich vs Dortmund",
    "PSG vs Marseille"
  ];

  print("Upcoming Matches:");
  for (String match in upcomingMatches) {
    print("• $match");
  }
  print("------------------------------------");

  // 3. Map
  Map<String, int> teamPoints = {
    "Manchester United": 45,
    "Liverpool": 50,
    "Arsenal": 48,
    "Manchester City": 55
  };

  print("Premier League Points:");
  teamPoints.forEach((team, points) {
    print("$team → $points points");
  });
  print("------------------------------------");

  // 4. Function
  String getWinner(String home, String away, int homeScore, int awayScore) {
    if (homeScore > awayScore) {
      return "$home wins the match!";
    } else if (awayScore > homeScore) {
      return "$away wins the match!";
    } else {
      return "The match is a Draw!";
    }
  }

  print(getWinner(teamA, teamB, scoreA, scoreB));
  print("------------------------------------");

  // 5. Class
  Match match1 = Match(
    homeTeam: "Manchester City",
    awayTeam: "Tottenham",
    homeScore: 3,
    awayScore: 1,
  );

  match1.displayResult();
}

class Match {
  String homeTeam;
  String awayTeam;
  int homeScore;
  int awayScore;

  Match({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
  });

  void displayResult() {
    print("Final Result:");
    print("$homeTeam  $homeScore - $awayScore  $awayTeam");

    if (homeScore > awayScore) {
      print("→ $homeTeam won the match!");
    } else if (awayScore > homeScore) {
      print("→ $awayTeam won the match!");
    } else {
      print("→ The match ended in a draw.");
    }
  }
}