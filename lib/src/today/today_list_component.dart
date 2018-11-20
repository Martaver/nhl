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
  List<Game> games;
  String tomorrowUrl;
  String getTomorrow() => tomorrowUrl;
  String yesterdayUrl;
  String getYesterday() => yesterdayUrl;

  TodayListComponent(this._todayListService);

  Future<void> _getGamesByDate(String date) async {
    games = await _todayListService.getGamesByDate(date);
  }

  void onActivate(_, RouterState current) async {
    final String date = getDateFromMap(current.parameters);

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

    tomorrowUrl = RoutePaths.schedule.toUrl(parameters: {date: tomorrow});
    print(tomorrowUrl);
    print(tomorrow);
    yesterdayUrl = RoutePaths.schedule.toUrl(parameters: {date: yesterday});

    if (date != null) _getGamesByDate(date);
  }
}
