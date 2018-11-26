import 'package:angular_router/angular_router.dart';

import 'package:nhl/src/game_review/game_review_component.template.dart' as game_review_template;
import 'package:nhl/src/game_details/game_details_component.template.dart' as game_details_template;

import 'game_route_paths.dart';
export 'game_route_paths.dart';

class Routes {
  static final review = RouteDefinition(
    routePath: RoutePaths.review,
    component: game_review_template.GameReviewComponentNgFactory,
  );

  static final details = RouteDefinition(
    routePath: RoutePaths.details,
    component: game_details_template.GameDetailsComponentNgFactory,
  );
  static final all = <RouteDefinition>[
    details,
    review,
  ];
}