import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/models/game_attendance.dart';
import 'package:nhl/src/models/game_review.dart';
import 'package:nhl/src/models/game_details.dart';
import 'package:nhl/src/router/game/game_routes.dart';
import 'package:nhl/src/services/game_attendance.service.dart';
import 'package:nhl/src/services/game_review.service.dart';
import 'package:nhl/src/services/game_details.service.dart';
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
    ClassProvider(GameAttendanceService),
  ],
  pipes: [commonPipes],
)

class GameDetailsComponent implements OnActivate {

  final GameReviewService gameReviewService;
  final GameDetailsService gameDetailsService;
  final UserProfileService userProfileService;
  final GameAttendanceService gameAttendanceService;
  final Location _location;

  GameDetailsComponent(
      this.gameReviewService,
      this.gameDetailsService,
      this.userProfileService,
      this.gameAttendanceService,
      this._location,
      );

  /**
   * Detailed game information
   */
  GameDetails details;

  /**
   * A list of review for this game
   */
  List<GameReview> reviews;

  /**
   * The ID number of the game that we would like to view.
   */
  String gameId;

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

  /**
   * go back to schedule
   */
  void goBack() => _location.back();


  void onActivate(_, RouterState current) async {
    // get the game ID from the route
    gameId = current.parameters['gameid'];

    // then fetch the detailed game data.
    _getGameDetails(gameId);

    // pull reviews from firebase for this game (if there is any).
    _getReviewsForGame(gameId);

    // IF the game date is in the past

    // then get the team ids

    // fetch both of the rosters using team_roster_service.

    // show the rosters.

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
