
/// Written by Juan Pablo Gutiérrez
/// 12 - 07 - 2023
/// Represents a single team

class Team {
  final String teamNumber;

  Team({required this.teamNumber});

  factory Team.fromJson(Map<String, dynamic> jsonTeam) {
    return Team(
      teamNumber: jsonTeam["key"].substring(3),
    );
  }
}
