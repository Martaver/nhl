import 'dart:async';
import 'package:angular/core.dart';
import 'package:nhl/src/models/game_details.dart';
import 'package:nhl/src/api/Games.dart';

@Injectable()
class GameDetailsService {

  /**
   * Get detailed game data from the ID of the game
   */
  Future<GameDetails> getDetailsById(String id) async => fetchGameById(id);
}