/// Written by Juan Pablo Gutiérrez
/// 12 - 07 - 2023
/// Represents a single team

class Team {
  final String teamNumber;
  String? imgUrl;

  Team({required this.teamNumber, this.imgUrl});

  void setImgUrl(var url) {
    imgUrl = url;
  }

  factory Team.fromJson(Map<String, dynamic> jsonTeam) {
    return Team(
      teamNumber: jsonTeam["key"].substring(3),
    );
  }
}
