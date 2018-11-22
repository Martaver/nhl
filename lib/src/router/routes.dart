import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'package:nhl/src/today/today_list_component.template.dart' as today_list_template;
import 'package:nhl/src/game_details/game_details_component.template.dart' as game_details_template;
import 'package:nhl/src/game_review/game_review_component.template.dart' as game_review_template;

export 'route_paths.dart';

class Routes {
  static final schedule = RouteDefinition(
    routePath: RoutePaths.schedule,
    component: today_list_template.TodayListComponentNgFactory,
  );

  static final review = RouteDefinition(
    routePath: RoutePaths.review,
    component: game_review_template.GameReviewComponentNgFactory,
  );

  static final details = RouteDefinition(
    routePath: RoutePaths.details,
    component: game_details_template.GameDetailsComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    schedule,
    details,
    review,
  ];
}