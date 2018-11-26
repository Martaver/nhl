import 'package:angular/core.dart';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';
import 'package:nhl/src/models/game_attendance.dart';
import 'package:nhl/src/services/constants.dart';

@Injectable()
class GameAttendanceService {

  CollectionReference AttendanceFor(String gameId) => fb.firestore().collection(COLLECTION_GAME).doc(gameId).collection(COLLECTION_GAME_ATTENDANCE);

  /**
   * Mark the user as attending a game, adding their GameAttendance info.
   */
  Future<void> markAttending(String gameId, String userId, GameAttendance attendance) => AttendanceFor(gameId).doc(userId).set(attendance.toJson()); 

  /**
   * Mark the user as NOT attending a game.
   */
  Future<void> markNotAttending(String gameId, String userId) => AttendanceFor(gameId).doc(userId).delete();

  /**
   * Gets the number of users attending a game.
   */
  Future<int> getAttendeeCount(String gameId) async => (await AttendanceFor(gameId).get()).size;

  /**
   * Gets all GameAttendance details for all users attending a game.
   */
  Future<List<GameAttendance>> getAttendees(String gameId) async => ( await AttendanceFor(gameId).get()).docs.map((doc) => GameAttendance.fromDoc(doc)).toList();
}