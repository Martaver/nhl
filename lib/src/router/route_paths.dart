import 'package:angular_router/angular_router.dart';

const date = 'date';
const gameId = 'gameId';
const reviewId = 'reviewId';

class RoutePaths {
  static final schedule = RoutePath(path: 'schedule/:$date');
  static final details = RoutePath(path: 'game/:$gameId');
  static final review = RoutePath(path: 'game/:$gameId/:$reviewId');
}

String getDateFromMap(Map<String, String> params) {
  final dateRoute = params[date];
  return dateRoute == null ? null : dateRoute;
}