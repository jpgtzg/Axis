/// Written by Juan Pablo Gutiérrez
/// 06 - 07 - 2023
/// Represents a team rank on a ranking table for an event

class Rank {
  late String team;
  final double rankingPoints;
  final int rank;

  Rank({required this.team, required this.rankingPoints, required this.rank}) {
    team = team.substring(3);
  }

  factory Rank.fromJson(Map<String, dynamic> jsonRank) {
    return Rank(
      team: jsonRank["team_key"] as String,
      rankingPoints: jsonRank["sort_orders"][0] as double,
      rank: jsonRank["rank"] as int,
    );
  }
}
