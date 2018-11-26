// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDetails _$GameDetailsFromJson(Map<String, dynamic> json) {
  return GameDetails(
      gameData: GameData.fromJson(json['gameData'] as Map<String, dynamic>),
      liveData: LiveData.fromJson(json['liveData'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GameDetailsToJson(GameDetails instance) =>
    <String, dynamic>{
      'gameData': instance.gameData,
      'liveData': instance.liveData
    };

GameData _$GameDataFromJson(Map<String, dynamic> json) {
  return GameData(
      game: GameInfo.fromJson(json['game'] as Map<String, dynamic>),
      status: GameStatus.fromJson(json['status'] as Map<String, dynamic>),
      teams: Teams.fromJson(json['teams'] as Map<String, dynamic>),
      players: Players.fromJson(json['players'] as Map<String, dynamic>),
      venue: Venue.fromJson(json['venue'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GameDataToJson(GameData instance) => <String, dynamic>{
      'game': instance.game,
      'status': instance.status,
      'teams': instance.teams,
      'players': instance.players,
      'venue': instance.venue
    };

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) {
  return GameInfo(
      pk: json['pk'] as int,
      season: json['season'] as String,
      type: json['type'] as String);
}

Map<String, dynamic> _$GameInfoToJson(GameInfo instance) => <String, dynamic>{
      'pk': instance.pk,
      'season': instance.season,
      'type': instance.type
    };

GameStatus _$GameStatusFromJson(Map<String, dynamic> json) {
  return GameStatus(
      abstractGameState: json['abstractGameState'] as String,
      codedGameState: json['codedGameState'] as String,
      detailedState: json['detailedState'] as String);
}

Map<String, dynamic> _$GameStatusToJson(GameStatus instance) =>
    <String, dynamic>{
      'abstractGameState': instance.abstractGameState,
      'codedGameState': instance.codedGameState,
      'detailedState': instance.detailedState
    };

Players _$PlayersFromJson(Map<String, dynamic> json) {
  return Players(
      playerList: (json['playerList'] as List)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$PlayersToJson(Players instance) =>
    <String, dynamic>{'playerList': instance.playerList};

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      primaryNumber: json['primaryNumber'] as String,
      birthDate: json['birthDate'] as String,
      currentAge: json['currentAge'] as int,
      birthCity: json['birthCity'] as String,
      birthStateProvince: json['birthStateProvince'] as String,
      birthCountry: json['birthCountry'] as String,
      nationality: json['nationality'] as String,
      height: json['height'] as String,
      weight: json['weight'] as int,
      currentTeam: json['currentTeam'] == null
          ? null
          : CurrentTeam.fromJson(json['currentTeam'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'primaryNumber': instance.primaryNumber,
      'birthDate': instance.birthDate,
      'currentAge': instance.currentAge,
      'birthCity': instance.birthCity,
      'birthStateProvince': instance.birthStateProvince,
      'birthCountry': instance.birthCountry,
      'nationality': instance.nationality,
      'height': instance.height,
      'weight': instance.weight,
      'currentTeam': instance.currentTeam
    };

Teams _$TeamsFromJson(Map<String, dynamic> json) {
  return Teams(
      home: Team.fromJson(json['home'] as Map<String, dynamic>),
      away: Team.fromJson(json['away'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TeamsToJson(Teams instance) =>
    <String, dynamic>{'home': instance.home, 'away': instance.away};

CurrentTeam _$CurrentTeamFromJson(Map<String, dynamic> json) {
  return CurrentTeam(id: json['id'] as int, name: json['name'] as String);
}

Map<String, dynamic> _$CurrentTeamToJson(CurrentTeam instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
      id: json['id'] as int,
      name: json['name'] as String,
      abbreviation: json['abbreviation'] as String);
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbreviation': instance.abbreviation
    };

Venue _$VenueFromJson(Map<String, dynamic> json) {
  return Venue(name: json['name'] as String);
}

Map<String, dynamic> _$VenueToJson(Venue instance) =>
    <String, dynamic>{'name': instance.name};

LiveData _$LiveDataFromJson(Map<String, dynamic> json) {
  return LiveData(
      linescore: LineScore.fromJson(json['linescore'] as Map<String, dynamic>),
      boxscore: BoxScore.fromJson(json['boxscore'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LiveDataToJson(LiveData instance) => <String, dynamic>{
      'linescore': instance.linescore,
      'boxscore': instance.boxscore
    };

LineScore _$LineScoreFromJson(Map<String, dynamic> json) {
  return LineScore(
      currentPeriod: json['currentPeriod'] as int,
      currentPeriodTimeRemaining: json['currentPeriodTimeRemaining'] as String,
      periods: (json['periods'] as List)
          ?.map((e) =>
              e == null ? null : Period.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LineScoreToJson(LineScore instance) => <String, dynamic>{
      'currentPeriod': instance.currentPeriod,
      'currentPeriodTimeRemaining': instance.currentPeriodTimeRemaining,
      'periods': instance.periods
    };

Period _$PeriodFromJson(Map<String, dynamic> json) {
  return Period(
      periodType: json['periodType'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      num: json['num'] as int,
      home: json['home'] == null
          ? null
          : PeriodTeam.fromJson(json['home'] as Map<String, dynamic>),
      away: json['away'] == null
          ? null
          : PeriodTeam.fromJson(json['away'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PeriodToJson(Period instance) => <String, dynamic>{
      'periodType': instance.periodType,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'num': instance.num,
      'home': instance.home,
      'away': instance.away
    };

PeriodTeam _$PeriodTeamFromJson(Map<String, dynamic> json) {
  return PeriodTeam(
      goals: json['goals'] as int,
      shotsOnGoal: json['shotsOnGoal'] as int,
      rinkSide: json['rinkSide'] as String);
}

Map<String, dynamic> _$PeriodTeamToJson(PeriodTeam instance) =>
    <String, dynamic>{
      'goals': instance.goals,
      'shotsOnGoal': instance.shotsOnGoal,
      'rinkSide': instance.rinkSide
    };

LineScoreTeams _$LineScoreTeamsFromJson(Map<String, dynamic> json) {
  return LineScoreTeams(
      home: json['home'] == null
          ? null
          : LineScoreTeam.fromJson(json['home'] as Map<String, dynamic>),
      away: json['away'] == null
          ? null
          : LineScoreTeam.fromJson(json['away'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LineScoreTeamsToJson(LineScoreTeams instance) =>
    <String, dynamic>{'home': instance.home, 'away': instance.away};

LineScoreTeam _$LineScoreTeamFromJson(Map<String, dynamic> json) {
  return LineScoreTeam(
      goals: json['goals'] as int,
      shotsOnGoal: json['shotsOnGoal'] as int,
      goaliePulled: json['goaliePulled'] as bool,
      numSkaters: json['numSkaters'] as int,
      powerPlay: json['powerPlay'] as bool,
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LineScoreTeamToJson(LineScoreTeam instance) =>
    <String, dynamic>{
      'goals': instance.goals,
      'shotsOnGoal': instance.shotsOnGoal,
      'goaliePulled': instance.goaliePulled,
      'numSkaters': instance.numSkaters,
      'powerPlay': instance.powerPlay,
      'team': instance.team
    };

BoxScore _$BoxScoreFromJson(Map<String, dynamic> json) {
  return BoxScore(
      teams: json['teams'] == null
          ? null
          : BoxScoreTeams.fromJson(json['teams'] as Map<String, dynamic>));
}

Map<String, dynamic> _$BoxScoreToJson(BoxScore instance) =>
    <String, dynamic>{'teams': instance.teams};

BoxScoreTeams _$BoxScoreTeamsFromJson(Map<String, dynamic> json) {
  return BoxScoreTeams(
      home: json['home'] == null
          ? null
          : BoxScoreTeam.fromJson(json['home'] as Map<String, dynamic>),
      away: json['away'] == null
          ? null
          : BoxScoreTeam.fromJson(json['away'] as Map<String, dynamic>));
}

Map<String, dynamic> _$BoxScoreTeamsToJson(BoxScoreTeams instance) =>
    <String, dynamic>{'home': instance.home, 'away': instance.away};

BoxScoreTeam _$BoxScoreTeamFromJson(Map<String, dynamic> json) {
  return BoxScoreTeam(
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      teamStats: json['teamStats'] == null
          ? null
          : TeamStats.fromJson(json['teamStats'] as Map<String, dynamic>),
      players: json['players'] == null
          ? null
          : BoxScorePlayers.fromJson(json['players'] as Map<String, dynamic>));
}

Map<String, dynamic> _$BoxScoreTeamToJson(BoxScoreTeam instance) =>
    <String, dynamic>{
      'team': instance.team,
      'teamStats': instance.teamStats,
      'players': instance.players
    };

TeamStats _$TeamStatsFromJson(Map<String, dynamic> json) {
  return TeamStats(
      teamSkaterStats: json['teamSkaterStats'] == null
          ? null
          : TeamSkaterStats.fromJson(
              json['teamSkaterStats'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TeamStatsToJson(TeamStats instance) =>
    <String, dynamic>{'teamSkaterStats': instance.teamSkaterStats};

TeamSkaterStats _$TeamSkaterStatsFromJson(Map<String, dynamic> json) {
  return TeamSkaterStats(
      goals: json['goals'] as int,
      pim: json['pim'] as int,
      shots: json['shots'] as int,
      powerPlayPercentage: json['powerPlayPercentage'] as String,
      powerPlayGoals: json['powerPlayGoals'] as int,
      powerPlayOpportunities: json['powerPlayOpportunities'] as int,
      faceOffWinPercentage: json['faceOffWinPercentage'] as String,
      blocked: json['blocked'] as int,
      takeaways: json['takeaways'] as int,
      giveaways: json['giveaways'] as int,
      hits: json['hits'] as int);
}

Map<String, dynamic> _$TeamSkaterStatsToJson(TeamSkaterStats instance) =>
    <String, dynamic>{
      'goals': instance.goals,
      'pim': instance.pim,
      'shots': instance.shots,
      'powerPlayPercentage': instance.powerPlayPercentage,
      'powerPlayGoals': instance.powerPlayGoals,
      'powerPlayOpportunities': instance.powerPlayOpportunities,
      'faceOffWinPercentage': instance.faceOffWinPercentage,
      'blocked': instance.blocked,
      'takeaways': instance.takeaways,
      'giveaways': instance.giveaways,
      'hits': instance.hits
    };

BoxScorePlayers _$BoxScorePlayersFromJson(Map<String, dynamic> json) {
  return BoxScorePlayers(
      playerList: (json['playerList'] as List)
          ?.map((e) => e == null
              ? null
              : BoxScorePlayer.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$BoxScorePlayersToJson(BoxScorePlayers instance) =>
    <String, dynamic>{'playerList': instance.playerList};

BoxScorePlayer _$BoxScorePlayerFromJson(Map<String, dynamic> json) {
  return BoxScorePlayer(
      person: json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>),
      stats: json['stats'] == null
          ? null
          : PlayerStats.fromJson(json['stats'] as Map<String, dynamic>));
}

Map<String, dynamic> _$BoxScorePlayerToJson(BoxScorePlayer instance) =>
    <String, dynamic>{
      'person': instance.person,
      'position': instance.position,
      'stats': instance.stats
    };

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(id: json['id'] as int, fullName: json['fullName'] as String);
}

Map<String, dynamic> _$PersonToJson(Person instance) =>
    <String, dynamic>{'id': instance.id, 'fullName': instance.fullName};

Position _$PositionFromJson(Map<String, dynamic> json) {
  return Position(
      code: json['code'] as String,
      name: json['name'] as String,
      type: json['type'] as String);
}

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'type': instance.type
    };

PlayerStats _$PlayerStatsFromJson(Map<String, dynamic> json) {
  return PlayerStats(
      skaterStats: json['skaterStats'] == null
          ? null
          : SkaterStats.fromJson(json['skaterStats'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlayerStatsToJson(PlayerStats instance) =>
    <String, dynamic>{'skaterStats': instance.skaterStats};

SkaterStats _$SkaterStatsFromJson(Map<String, dynamic> json) {
  return SkaterStats(
      assists: json['assists'] as int,
      goals: json['goals'] as int,
      shots: json['shots'] as int,
      hits: json['hits'] as int,
      powerPlayGoals: json['powerPlayGoals'] as int,
      powerPlayAssists: json['powerPlayAssists'] as int,
      penaltyMinutes: json['penaltyMinutes'] as int,
      faceOffWins: json['faceOffWins'] as int,
      faceoffTaken: json['faceoffTaken'] as int,
      takeaways: json['takeaways'] as int,
      giveaways: json['giveaways'] as int,
      shortHandedGoals: json['shortHandedGoals'] as int,
      shortHandedAssists: json['shortHandedAssists'] as int,
      blocked: json['blocked'] as int,
      plusMinus: json['plusMinus'] as int,
      evenTimeOnIce: json['evenTimeOnIce'] as String,
      powerPlayTimeOnIce: json['powerPlayTimeOnIce'] as String,
      shortHandedTimeOnIce: json['shortHandedTimeOnIce'] as String);
}

Map<String, dynamic> _$SkaterStatsToJson(SkaterStats instance) =>
    <String, dynamic>{
      'assists': instance.assists,
      'goals': instance.goals,
      'shots': instance.shots,
      'hits': instance.hits,
      'powerPlayGoals': instance.powerPlayGoals,
      'powerPlayAssists': instance.powerPlayAssists,
      'penaltyMinutes': instance.penaltyMinutes,
      'faceOffWins': instance.faceOffWins,
      'faceoffTaken': instance.faceoffTaken,
      'takeaways': instance.takeaways,
      'giveaways': instance.giveaways,
      'shortHandedGoals': instance.shortHandedGoals,
      'shortHandedAssists': instance.shortHandedAssists,
      'blocked': instance.blocked,
      'plusMinus': instance.plusMinus,
      'evenTimeOnIce': instance.evenTimeOnIce,
      'powerPlayTimeOnIce': instance.powerPlayTimeOnIce,
      'shortHandedTimeOnIce': instance.shortHandedTimeOnIce
    };
