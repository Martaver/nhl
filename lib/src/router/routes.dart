import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'package:nhl/src/today/today_list_component.template.dart' as today_list_template;

export 'route_paths.dart';

class Routes {
  static final today = RouteDefinition(
    routePath: RoutePaths.today,
    component: today_list_template.TodayListComponentNgFactory,
  );

  static final schedule = RouteDefinition(
    routePath: RoutePaths.schedule,
    component: today_list_template.TodayListComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    today,
    schedule,
  ];
}