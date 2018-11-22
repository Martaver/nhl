import 'package:angular_router/angular_router.dart';

const date = 'date';

class RoutePaths {
  static final schedule = RoutePath(path: 'schedule/:$date');
  static final game = RoutePath(path: 'game/');
}

String getDateFromMap(Map<String, String> params) {
  final dateRoute = params[date];
  return dateRoute == null ? null : dateRoute;
}