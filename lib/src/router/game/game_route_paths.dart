import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/router/route_paths.dart' as parent;

const reviewId = 'reviewId';
const gameId = 'gameId';

class RoutePaths {

  static final review = RoutePath(
    path: 'review/:$reviewId',
    parent: parent.RoutePaths.game,
  );

  static final details = RoutePath(
    path: ':$gameId/',
    parent: parent.RoutePaths.game,
  );
}

