import 'package:json_annotation/json_annotation.dart';

part 'game_details.g.dart';


@JsonSerializable(nullable: false)
class GameDetails {
  GameData gameData;
  LiveData liveData;

  GameDetails({ this.gameData, this.liveData });
  factory GameDetails.fromJson(Map<String, dynamic> json) => _$GameDetailsFromJson(json);
}

@JsonSerializable(nullable: false)
class GameData {
  GameInfo game;
  GameStatus status;
  Teams teams;
  Players players;
  Venue venue;

  GameData({ this.game, this.status, this.teams, this.players, this.venue });
  factory GameData.fromJson(Map<String, dynamic> json) => _$GameDataFromJson(json);
}

@JsonSerializable(nullable: false)
class GameInfo {
  int pk;
  String season;
  String type;

  GameInfo({this.pk, this.season, this.type});
  factory GameInfo.fromJson(Map<String, dynamic> json) => _$GameInfoFromJson(json);
}

@JsonSerializable(nullable: false)
class GameStatus {
  String abstractGameState;
  String codedGameState;
  String detailedState;

  GameStatus({
    this.abstractGameState,
    this.codedGameState,
    this.detailedState
  });
  factory GameStatus.fromJson(Map<String, dynamic> json) => _$GameStatusFromJson(json);
}

@JsonSerializable(nullable: false)
class Players {
  List<Player> playerList;

  Players({ this.playerList });
  factory Players.fromJson(Map<String, dynamic> json) {
    return Players(playerList: json
        .values
        .map((dynamic p) => Player.fromJson(p))
        .toList());
  }
}

@JsonSerializable()
class Player {
  int id;
  String fullName;
  String firstName;
  String lastName;
  String primaryNumber;
  String birthDate;
  int currentAge;
  String birthCity;
  String birthStateProvince;
  String birthCountry;
  String nationality;
  String height;
  int weight;
  CurrentTeam currentTeam;

  Player({
    this.id,
    this.fullName,
    this.firstName,
    this.lastName,
    this.primaryNumber,
    this.birthDate,
    this.currentAge,
    this.birthCity,
    this.birthStateProvince,
    this.birthCountry,
    this.nationality,
    this.height,
    this.weight,
    this.currentTeam
  });
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

@JsonSerializable(nullable: false)
class Teams {
  Team home;
  Team away;

  Teams({this.home, this.away});
  factory Teams.fromJson(Map<String, dynamic> json) => _$TeamsFromJson(json);
}

@JsonSerializable()
class CurrentTeam {
  int id;
  String name;

  CurrentTeam({this.id, this.name});
  factory CurrentTeam.fromJson(Map<String, dynamic> json) => _$CurrentTeamFromJson(json);
}

@JsonSerializable(nullable: false)
class Team {
  int id;
  String name;
  String abbreviation;

  Team({this.id, this.name, this.abbreviation});
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}

@JsonSerializable(nullable: false)
class Venue {
  String name;

  Venue({this.name});
  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}

@JsonSerializable(nullable: false)
class LiveData {
   LineScore linescore;
   BoxScore boxscore;

   LiveData({
     this.linescore,
     this.boxscore,
   });

  factory LiveData.fromJson(Map<String, dynamic> json) => _$LiveDataFromJson(json);
}

@JsonSerializable()
class LineScore {
    int currentPeriod;
    String currentPeriodTimeRemaining;
   List<Period> periods;

   LineScore({
     this.currentPeriod,
     this.currentPeriodTimeRemaining,
     this.periods
   });

  factory LineScore.fromJson(Map<String, dynamic> json) => _$LineScoreFromJson(json);
}

@JsonSerializable()
class Period {
  String periodType;
  String startTime;
  String endTime;
  int num;
  PeriodTeam home;
  PeriodTeam away;

  Period({
    this.periodType,
    this.startTime,
    this.endTime,
    this.num,
    this.home,
    this.away
  });

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);
}

@JsonSerializable()
class PeriodTeam {
  int goals;
  int shotsOnGoal;
  String rinkSide;

  PeriodTeam({this.goals, this.shotsOnGoal, this.rinkSide});
  factory PeriodTeam.fromJson(Map<String, dynamic> json) => _$PeriodTeamFromJson(json);
}

@JsonSerializable()
class LineScoreTeams {
  LineScoreTeam home;
  LineScoreTeam away;

  LineScoreTeams({this.home, this.away});
  factory LineScoreTeams.fromJson(Map<String, dynamic> json) => _$LineScoreTeamsFromJson(json);
}

@JsonSerializable()
class LineScoreTeam {
  int goals;
  int shotsOnGoal;
  bool goaliePulled;
  int numSkaters;
  bool powerPlay;
  Team team;

  LineScoreTeam({
    this.goals,
    this.shotsOnGoal,
    this.goaliePulled,
    this.numSkaters,
    this.powerPlay,
    this.team,
  });

  factory LineScoreTeam.fromJson(Map<String, dynamic> json) => _$LineScoreTeamFromJson(json);
}

@JsonSerializable()
class BoxScore {
  BoxScoreTeams teams;

  BoxScore({ this.teams });
  factory BoxScore.fromJson(Map<String, dynamic> json) => _$BoxScoreFromJson(json);
}

@JsonSerializable()
class BoxScoreTeams {
  BoxScoreTeam home;
  BoxScoreTeam away;
  BoxScoreTeams({ this.home, this.away });
  factory BoxScoreTeams.fromJson(Map<String, dynamic> json) => _$BoxScoreTeamsFromJson(json);
}

@JsonSerializable()
class BoxScoreTeam {
  Team team;
  TeamStats teamStats;
  BoxScorePlayers players;

  BoxScoreTeam({ this.team, this.teamStats, this.players });
  factory BoxScoreTeam.fromJson(Map<String, dynamic> json) => _$BoxScoreTeamFromJson(json);
}

@JsonSerializable()
class TeamStats {
  TeamSkaterStats teamSkaterStats;

  TeamStats({this.teamSkaterStats});
  factory TeamStats.fromJson(Map<String, dynamic> json) => _$TeamStatsFromJson(json);
}

@JsonSerializable()
class TeamSkaterStats {
  int goals;
  int pim;
  int shots;
  String powerPlayPercentage;
  int powerPlayGoals;
  int powerPlayOpportunities;
  String faceOffWinPercentage;
  int blocked;
  int takeaways;
  int giveaways;
  int hits;

  TeamSkaterStats({
    this.goals,
    this.pim,
    this.shots,
    this.powerPlayPercentage,
    this.powerPlayGoals,
    this.powerPlayOpportunities,
    this.faceOffWinPercentage,
    this.blocked,
    this.takeaways,
    this.giveaways,
    this.hits,
  });
  factory TeamSkaterStats.fromJson(Map<String, dynamic> json) => _$TeamSkaterStatsFromJson(json);
}

@JsonSerializable()
class BoxScorePlayers {
  List<BoxScorePlayer> playerList;

  BoxScorePlayers({ this.playerList });
  factory BoxScorePlayers.fromJson(Map<String, dynamic> json) {
    return BoxScorePlayers(playerList: json
        .values
        .map((dynamic p) => BoxScorePlayer.fromJson(p))
        .toList());
  }
}

@JsonSerializable()
class BoxScorePlayer {
  Person person;
  Position position;
  PlayerStats stats;

  BoxScorePlayer({ this.person, this.position, this.stats });
  factory BoxScorePlayer.fromJson(Map<String, dynamic> json) => _$BoxScorePlayerFromJson(json);
}

@JsonSerializable()
class Person {
  int id;
  String fullName;
  Person({ this.id, this.fullName });
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}

@JsonSerializable()
class Position {
  String code;
  String name;
  String type;

  Position({ this.code, this.name, this.type });
  factory Position.fromJson(Map<String, dynamic> json) => _$PositionFromJson(json);
}

@JsonSerializable()
class PlayerStats {
  SkaterStats skaterStats;
  PlayerStats({this.skaterStats});
  factory PlayerStats.fromJson(Map<String, dynamic> json) => _$PlayerStatsFromJson(json);
}

@JsonSerializable()
class SkaterStats {
  int assists;
  int goals;
  int shots;
  int hits;
  int powerPlayGoals;
  int powerPlayAssists;
  int penaltyMinutes;
  int faceOffWins;
  int faceoffTaken;
  int takeaways;
  int giveaways;
  int shortHandedGoals;
  int shortHandedAssists;
  int blocked;
  int plusMinus;
  String evenTimeOnIce;
  String powerPlayTimeOnIce;
  String shortHandedTimeOnIce;

  SkaterStats({
    this.assists,
    this.goals,
    this.shots,
    this.hits,
    this.powerPlayGoals,
    this.powerPlayAssists,
    this.penaltyMinutes,
    this.faceOffWins,
    this.faceoffTaken,
    this.takeaways,
    this.giveaways,
    this.shortHandedGoals,
    this.shortHandedAssists,
    this.blocked,
    this.plusMinus,
    this.evenTimeOnIce,
    this.powerPlayTimeOnIce,
    this.shortHandedTimeOnIce,
  });

  factory SkaterStats.fromJson(Map<String, dynamic> json) => _$SkaterStatsFromJson(json);
}