import 'package:angular_router/angular_router.dart';

const date = 'date';
const gameid = 'gameid';

class RoutePaths {
  static final login = RoutePath(path: 'login');
  static final schedule = RoutePath(path: 'schedule/:$date');
  static final game = RoutePath(path: 'game/:$gameid');
}

String getDateFromMap(Map<String, String> params) {
  final dateRoute = params[date];
  return dateRoute == null ? null : dateRoute;
}