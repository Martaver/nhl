import 'package:angular/angular.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/app_layout/material_temporary_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';
import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/router/route_paths.dart';
import 'package:nhl/src/today/game_card_component.dart';
import 'package:nhl/src/today/today_list_service.dart';
import 'game.dart';
import 'package:nhl/src/router/routes.dart';

@Component(
  selector: 'today-list',
  styleUrls: [
    'today_list_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'today_list_component.html',
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

  // This isn't particularly nice or elegant but I can't figure out how to do
  // it nicely and I'm admitting defeat to AngularRouter
  void onActivate(_, RouterState current) async {
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
