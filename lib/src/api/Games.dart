import 'package:http/browser_client.dart';
import 'dart:convert';
import 'package:nhl/src/api/API.dart';
import 'package:nhl/src/utils/teams.dart';
import 'package:nhl/src/models/game.dart';
import 'package:nhl/src/models/game_details.dart';

String base = "https://statsapi.web.nhl.com/api/v1/";
String url = "schedule?date=2018-11-21";
String game = "game/2018020349/feed/live";


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


Future<GameDetails> fetchGameById(String gameId) async {
  var parsed;

  try {
    final response = await _http.get(
        API.baseUrl + API.getGamePathFromId(gameId));

    parsed = GameDetails.fromJson(json.decode(response.body));
  } catch (e) {
    print('whoops, error');
    print(e);
  } finally {
    return parsed;
  }
}
