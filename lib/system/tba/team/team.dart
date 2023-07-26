import '../../statbotics/epa.dart';

/// Written by Juan Pablo Gutiérrez
/// 12 - 07 - 2023
/// Represents a single team

class Team {
  final String teamNumber;
  final String teamName;
  double? opr;
  double? dpr;
  double? ccwm;
  String? imgUrl;
  EPA? epa;

  Team(
      {required this.teamNumber,
      required this.teamName,
      this.opr,
      this.dpr,
      this.ccwm,
      this.imgUrl,
      this.epa});

  void setImgUrl(var url) {
    imgUrl = url;
  }

  void setOpr(var opr) {
    this.opr = opr;
  }

  void setDpr(var dpr) {
    this.dpr = dpr;
  }

  void setCcwm(var ccwm) {
    this.ccwm = ccwm;
  }

  void setEPA(var epa){
    this.epa = epa;
  }

  factory Team.fromJson(Map<String, dynamic> jsonTeam) {
    return Team(
      teamNumber: jsonTeam["key"].substring(3),
      teamName: jsonTeam["nickname"],
    );
  }
}
