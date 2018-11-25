import 'package:http/browser_client.dart';
import 'dart:convert';
import 'package:nhl/src/api/API.dart';
import 'package:nhl/src/models/team_roster.dart';

final BrowserClient _http = new BrowserClient();

Future<List<Player>> fetchRosterById(String id) async {
  var parsed;

  try {
    final response = await _http.get(API.baseUrl + API.getRosterPathFromId(id));
    parsed = (json.decode(response.body)['roster'] as List)
        .map((dynamic p) => Player.fromJson(p));
  } catch (e) {
    print('Couldn\'t get players');
    print(e);
  } finally {
    return parsed;
  }
}