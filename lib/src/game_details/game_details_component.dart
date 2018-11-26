import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/models/game_attendance.dart';
import 'package:nhl/src/models/game_review.dart';
import 'package:nhl/src/models/game_details.dart' as GameDetails;
import 'package:nhl/src/models/team_roster.dart' as Roster;
import 'package:nhl/src/router/game/game_routes.dart';
import 'package:nhl/src/services/game_attendance.service.dart';
import 'package:nhl/src/services/game_review.service.dart';
import 'package:nhl/src/services/game_details.service.dart';
import 'package:nhl/src/services/team_roster.service.dart';
import 'package:nhl/src/services/user_profile.service.dart';

@Component(
  selector: 'game-detials',
  styleUrls: [
    'game_details_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'game_details_component.html',
  directives: [
    routerDirectives,
    coreDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
    NgFor
  ],
  exports: [RoutePaths, Routes],
  providers: [
    ClassProvider(GameReviewService),
    ClassProvider(GameDetailsService),
    ClassProvider(UserProfileService),
    ClassProvider(TeamRosterService),
    ClassProvider(GameAttendanceService),
  ],
  pipes: [commonPipes],
)

class GameDetailsComponent implements OnActivate {

  final GameReviewService gameReviewService;
  final GameDetailsService gameDetailsService;
  final UserProfileService userProfileService;
  final TeamRosterService teamRosterService;
  final GameAttendanceService gameAttendanceService;
  final Location _location;

  GameDetailsComponent(
      this.gameReviewService,
      this.gameDetailsService,
      this.userProfileService,
      this.gameAttendanceService,
      this.teamRosterService,
      this._location,
      );

  /**
   * Detailed game information
   */
  GameDetails.GameDetails details;

  /**
   * A list of review for this game
   */
  List<GameReview> reviews;

  /**
   * The ID number of the game that we would like to view.
   */
  String gameId;

  /**
   * A list of players on the home team.
   * Is of type List<Roster.Player> iff game is in the future.
   * Is of type List<GameDetails.Player> iff game is in the past
   */
  List<dynamic> homeRoster;

  /**
   * A list of players on the away team.
   * Is of type List<Roster.Player> iff game is in the future.
   * Is of type List<GameDetails.Player> iff game is in the past
   *
   * Dart doesn't seem to have type unions.... maybe?
   */
  List<dynamic> awayRoster;

  /**
   * Helper function for getting game details
   */
  Future<void> _getGameDetails(String id) async {
    details = await gameDetailsService.getDetailsById(id);
  }

  /**
   * Helper function for getting game reviews
   */
  Future<void> _getReviewsForGame(String id) async {
    reviews = await gameReviewService.all(id);
  }

  Future<List<Roster.Player>> _getTeamRoster(int teamId) async =>
      teamRosterService.getRosterById(teamId.toString());

  /**
   * go back to schedule
   */
  void goBack() => _location.back();


  void onActivate(_, RouterState current) async {
    // get the game ID from the route
    gameId = current.parameters['gameid'];

    // then fetch the detailed game data.
    await _getGameDetails(gameId);

    // pull reviews from firebase for this game (if there is any).
    _getReviewsForGame(gameId);

    // if the game doesn't have player data
    // then pull rosters from roster service and show those
    print('player list');
    print(details.gameData.players.playerList.length);

    if (details.gameData.players.playerList.length == 0) {
      _getTeamRoster(details.gameData.teams.home.id)
          .then((List<Roster.Player> roster) {
            homeRoster = roster;
            print(homeRoster);
      });

      _getTeamRoster(details.gameData.teams.away.id)
          .then((List<Roster.Player> roster) {
            awayRoster = roster;
            print(awayRoster);
      });

    } else {
      int homeTeam = details.gameData.teams.home.id;
      homeRoster = details.gameData.players.playerList
          .where((GameDetails.Player p) => p.currentTeam.id == homeTeam)
          .toList();

      int awayTeam = details.gameData.teams.away.id;
      awayRoster = details.gameData.players.playerList
          .where((GameDetails.Player p) => p.currentTeam.id == awayTeam)
          .toList();
    }


    // Testing/demonstrating attendance service here:
    var userId = userProfileService.currentUserId;
    
    var attendance = new GameAttendance(message: "Yaye, I'm going, can't wait!!", supportingTeamId: 'myTeamId');

    await gameAttendanceService.markAttending(gameId, userId, attendance);

    var count = await gameAttendanceService.getAttendeeCount(gameId);    
    print(count);

    var attendees = await gameAttendanceService.getAttendees(gameId);
    print(attendees);
    
    await gameAttendanceService.markNotAttending(gameId, userId);
  }

}
