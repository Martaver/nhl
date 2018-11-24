import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'package:nhl/src/game_schedule/game_schedule_component.template.dart' as game_schedule_template;
import 'package:nhl/src/game_details/game_container.template.dart' as game_template;
import 'package:nhl/src/login/login.template.dart' as login_template;

export 'route_paths.dart';

class Routes {

  static final home = RouteDefinition.redirect(
    path: '',
    redirectTo: RoutePaths.login.toUrl(),
  );

  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginComponentNgFactory,
  );

  static final schedule = RouteDefinition(
    routePath: RoutePaths.schedule,
    component: game_schedule_template.TodayListComponentNgFactory,
  );

  static final game = RouteDefinition(
    routePath: RoutePaths.game,
    component: game_template.GameContainerNgFactory,
  );

  static final all = <RouteDefinition>[
    login,
    home,
    game,
    schedule,
  ];
}