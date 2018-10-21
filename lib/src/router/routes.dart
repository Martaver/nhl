import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import '../today/today_list_component.template.dart' as today_list_template;
import '../today/game_detail_component.template.dart' as game_detail_template;

export 'route_paths.dart';

class Routes {
  static final gameDayList = RouteDefinition(
    routePath: RoutePaths.gameDayList,
    component: today_list_template.TodayListComponentNgFactory,
  );
  static final gameDetail = RouteDefinition(
    routePath: RoutePaths.gameDetail,
    component: game_detail_template.GameDetailComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    gameDayList,
    gameDetail,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.gameDayList.toUrl(),
    )
  ];
}