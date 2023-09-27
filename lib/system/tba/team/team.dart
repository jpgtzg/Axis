/// Written by Juan Pablo Gutiérrez
/// 12 - 07 - 2023
/// Represents a single team

import 'package:axis/system/tba/team/team_getter.dart';

import '../../statbotics/epa.dart';

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

  void setEPA(EPA epa) {
    this.epa = epa;
  }

  factory Team.fromJson(Map<String, dynamic> jsonTeam) {
    return Team(
      teamNumber: jsonTeam["key"].substring(3),
      teamName: jsonTeam["nickname"],
    );
  }

  Future<void> loadImage() async {
    var value = await getImageUrl(teamNumber, DateTime.now().year.toString());

    setImgUrl(value);
  }
}
