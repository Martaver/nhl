import 'package:angular/angular.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/app_layout/material_temporary_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/router/route_paths.dart';
import 'package:nhl/src/game_schedule/game_card_component.dart';
import 'package:nhl/src/services/game_schedule.service.dart';
import 'package:nhl/src/models/game.dart';
import 'package:nhl/src/router/routes.dart';

@Component(
  selector: 'game_schedule-list',
  styleUrls: [
    'game_schedule_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'game_schedule_component.html',
  directives: [
    coreDirectives,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialTemporaryDrawerComponent,
    MaterialToggleComponent,
    GameCardComponent,
    routerDirectives,
  ],
  providers: [ClassProvider(TodayListService)],
)

class TodayListComponent implements OnActivate {
  final TodayListService _todayListService;
  final Router _router;
  List<Game> games;
  String today;
  String tomorrowUrl;
  String yesterdayUrl;

  TodayListComponent(this._todayListService, this._router);

  Future<void> _getGamesByDate(String date) async {
    games = await _todayListService.getGamesByDate(date);
  }

  Future<NavigationResult> goToYesterday ()  =>
      _router.navigate(yesterdayUrl);

  Future<NavigationResult> goToTomorrow() =>
      _router.navigate(tomorrowUrl);

  bool isAuthenticated() => fb.auth().currentUser != null;
  // This isn't particularly nice or elegant but I can't figure out how to do
  // it nicely and I'm admitting defeat to AngularRouter
  void onActivate(_, RouterState current) async {

    // check if we are signed in - if not, redirect to login
    // TODO see if there's a way of doing this without having to check on each route
    if (!isAuthenticated()) {
      _router.navigate('/login');
      return;
    }

    final String date = getDateFromMap(current.parameters);

    today = DateTime
      .parse(date)
      .toIso8601String()
      .substring(0, 10);

    var tomorrow = DateTime
        .parse(date)
        .add(new Duration(days: 1))
        .toIso8601String()
        .substring(0, 10);

    var yesterday = DateTime
      .parse(date)
      .subtract(new Duration(days: 1))
      .toIso8601String()
      .substring(0, 10);

    tomorrowUrl = '/schedule/'+tomorrow;
    yesterdayUrl = '/schedule/'+yesterday;

    if (date != null) _getGamesByDate(date);
  }
}
