/// Written by Juan Pablo Gutiérrez
/// 26 - 07 - 2023

/// Represents the Expected Point Added (EPA) of a team, it is highly predictive measure of a team's performance
class EPA {
  final double start;
  final double end;
  final double mean;
  final double max;

  final double autoMean;
  final double teleopMean;
  final double endgameMean;

  final int wins;
  final int looses;
  final int ties;

  final double winrate;

  EPA(
      {required this.start,
      required this.end,
      required this.mean,
      required this.max,
      required this.autoMean,
      required this.teleopMean,
      required this.endgameMean,
      required this.wins,
      required this.looses,
      required this.ties,
      required this.winrate});

  //Factory fromJson
  factory EPA.fromJson(Map<dynamic, dynamic> jsonEPA) {
    return EPA(
      start: jsonEPA["epa_start"],
      end: jsonEPA["epa_end"],
      mean: jsonEPA["epa_mean"],
      max: jsonEPA["epa_max"],
      autoMean: jsonEPA["auto_epa_mean"],
      teleopMean: jsonEPA["teleop_epa_mean"],
      endgameMean: jsonEPA["endgame_epa_mean"],
      wins: jsonEPA["wins"],
      looses: jsonEPA["losses"],
      ties: jsonEPA["ties"],
      winrate: jsonEPA["winrate"],
    );
  }
}
