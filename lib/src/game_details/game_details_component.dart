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
import 'package:nhl/src/services/selfie.service.dart';
import 'package:nhl/src/services/team_roster.service.dart';
import 'package:nhl/src/services/user_profile.service.dart';
import 'package:random_string/random_string.dart';
import 'package:nhl/src/api/API.dart';


@Component(
  selector: 'game-detials',
  styleUrls: [
    'game_details_component.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
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
    ClassProvider(SelfieService),
  ],
  pipes: [commonPipes],
)
class GameDetailsComponent implements OnActivate {
  final GameReviewService gameReviewService;
  final GameDetailsService gameDetailsService;
  final UserProfileService userProfileService;
  final TeamRosterService teamRosterService;
  final GameAttendanceService gameAttendanceService;
  final SelfieService selfieService;
  final Location _location;

  GameDetailsComponent(
    this.gameReviewService,
    this.gameDetailsService,
    this.userProfileService,
    this.gameAttendanceService,
    this.teamRosterService,
    this.selfieService,
    this._location,
      this._router,
  );

  /**
   * Detailed game information
   */
  GameDetails.GameDetails details;

  /**
   * Router
   */
  Router _router;

  /**
   * A list of review for this game
   */
  List<GameReview> reviews;

  /**
   * Selfie
   */
  Map<String, String> selfies = Map();

  /**
   * The ID number of the game that we would like to view.
   */
  String gameId;

  /**
   * The firebase ID of the user.
   */
  var userId;

  /**
   * If the user is going to the game
   */
  bool userGoing;

  /**
   * The list of attendees
   */
  List<GameAttendance> attendees;

  /**
   * The number of Atendees
   */
  int attendeeCount;

  /**
   * Is the game in the past? i.e has already happened
   */
  bool hasBeenPlayed;

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
   * URLs to team SVG logo
   */
  String homeTeamLogoUrl;
  String awayTeamLogoUrl;


  /**
   * Helper function for getting game details
   */
  Future<void> _getGameDetails(String id) async {
    details = await gameDetailsService.getDetailsById(id);
  }

  /**
   * Mark user as attending game
   */
  void markAttending() {
    gameAttendanceService.markAttending(gameId, userId, new GameAttendance());
    userGoing = true;
  }

  /**
   * mark user as not attending game
   */
  void markNotAttending() {
    gameAttendanceService.markNotAttending(gameId, userId);
    userGoing = false;
  }


  Future<NavigationResult> leaveReview() {
    String reviewId = randomAlphaNumeric(16);
    return _router.navigate('game/${gameId}/review/${reviewId}');
  }

  /**
     * Helper function for getting game reviews
     */
  Future<void> _getReviewsForGame(String id) async {
    reviews = await gameReviewService.all(id);

    // pull selfies if there are any
    reviews.forEach((GameReview r) {
      if (r.hasSelfie != null && r.hasSelfie) {
        selfieService.getUrl(r.id).then((Uri uri) {
          if (uri != null) {
            selfies[r.id] = uri.toString();
          }
        });
      }
    });
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

    homeTeamLogoUrl = API.getImageUrlFromTeamId(details.gameData.teams.home.id);
    awayTeamLogoUrl = API.getImageUrlFromTeamId(details.gameData.teams.away.id);

    // pull reviews from firebase for this game (if there is any).
    _getReviewsForGame(gameId);

    if (details.liveData.boxscore.teams.away.players.playerList.length == 0) {
      hasBeenPlayed = false;
      _getTeamRoster(details.gameData.teams.home.id)
          .then((List<Roster.Player> roster) {
        homeRoster = roster;
      });

      _getTeamRoster(details.gameData.teams.away.id)
          .then((List<Roster.Player> roster) {
        awayRoster = roster;
      });
    } else {
      hasBeenPlayed = true;
      homeRoster = details.liveData.boxscore.teams.home.players.playerList;
      awayRoster = details.liveData.boxscore.teams.away.players.playerList;
    }

    try {
      userId = userProfileService.currentUserId;
    } catch (e) {
      _router.navigate('login');
    }

    attendees = await gameAttendanceService.getAttendees(gameId);
    attendeeCount = attendees.length;

    if (attendees.where((GameAttendance g) => g.userId == userId).length > 0) {
      userGoing = true;
    } else {
      userGoing = false;
    }
  }
}
