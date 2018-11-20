import 'package:http/browser_client.dart';
import 'dart:convert';
import 'package:nhl/src/api/API.dart';
import 'package:nhl/src/utils/teams.dart';
import 'package:nhl/src/today/game.dart';

String url = "http://statsapi.web.nhl.com/api/v1/schedule?date=2018-11-21";


Game parseJsonMapToGame(Map m) {
  Map teams = m['teams'];
  int id = m['gamePk'];
  String home = teams['home']['team']['name'];
  String homeAbbr = matchTeamNameToAbbreviation(home);
  int homeTeamId = teams['home']['team']['id'];
  int homeScore = teams['home']['score'];
  String away = teams['away']['team']['name'];
  String awayAbbr = matchTeamNameToAbbreviation(away);
  int awayTeamId = teams['away']['team']['id'];
  int awayScore = teams['away']['score'];
  String gameDate = m['gameDate'];
  String gameState = m['status']['abstractGameState'];

  return new Game(
      id,
      home,
      homeAbbr,
      homeTeamId,
      homeScore,
      away,
      awayAbbr,
      awayTeamId,
      awayScore,
      DateTime.parse(gameDate),
      gameState
  );
}

final BrowserClient _http = new BrowserClient();

Future<List<Game>> fetchGamesByDate(String date) async {
  String query = '?date='+date;
  var parsed;
  try {
    final response = await _http.get(API.baseUrl + API.schedule + query);
    final games = (json.decode(response.body)['dates'][0]['games'] as List);
    parsed = games.map((game) => parseJsonMapToGame(game)).toList();
  } catch (e) {
    print(e);
  } finally {
    return parsed;
  }
}
