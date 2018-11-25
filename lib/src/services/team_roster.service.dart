import 'dart:async';
import 'package:angular/core.dart';
import 'package:nhl/src/models/team_roster.dart';
import 'package:nhl/src/api/Team.dart';

@Injectable()
class TeamRosterService {

  /**
   * Get detailed game data from the ID of the game
   */
  Future<List<Player>> getRosterById(String id) async => fetchRosterById(id);
}