/// Written by Juan Pablo Gutiérrez
/// 05 - 07 - 2023
/// Represents a playable match by a Team

class FRCMatch {
  final String winningAlliance;
  final List<dynamic> blueAlliance;
  final List<dynamic> redAlliance;
  final int blueScore;
  final int redScore;
  final String matchKey;
  late String matchNumType;

  FRCMatch({
    required this.matchKey,
    required this.winningAlliance,
    required this.blueAlliance,
    required this.redAlliance,
    required this.blueScore,
    required this.redScore,
  }) {
    matchNumType = matchKey.split("_")[1];
    matchNumType = (matchNumType.startsWith("f"))
        ? "Final ${matchNumType[1]} Match ${matchNumType[3]}"
        : ((matchNumType.startsWith("q"))
            ? "Qual ${matchNumType.substring(2)}"
            : ((matchNumType.startsWith("s"))
                ? "Semi ${matchNumType.substring(2).split("m")[0]}"
                : matchNumType));

    if (blueAlliance.isNotEmpty) {
      for (var i = 0; i < blueAlliance.length; i++) {
        blueAlliance[i] = blueAlliance[i].toString().substring(3);
      }
    }
    if (redAlliance.isNotEmpty) {
      for (var i = 0; i < redAlliance.length; i++) {
        redAlliance[i] = redAlliance[i].toString().substring(3);
      }
    }
  }

  factory FRCMatch.fromJson(Map<String, dynamic> jsonMatch) {
    return FRCMatch(
      winningAlliance: jsonMatch["winning_alliance"] as String,
      blueAlliance:
          jsonMatch["alliances"]["blue"]["team_keys"] as List<dynamic>,
      redAlliance: jsonMatch["alliances"]["red"]["team_keys"] as List<dynamic>,
      blueScore: jsonMatch["alliances"]["blue"]["score"] as int,
      redScore: jsonMatch["alliances"]["red"]["score"] as int,
      matchKey: jsonMatch["key"] as String,
    );
  }
}
