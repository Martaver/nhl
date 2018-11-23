import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/router/route_paths.dart' as parent;

const reviewId = 'reviewId';

class RoutePaths {

  static final review = RoutePath(
    path: 'review/:$reviewId',
    parent: parent.RoutePaths.game,
  );

  static final details = RoutePath(
    path: 'details/',
    parent: parent.RoutePaths.game,
  );
}

