import 'package:angular_router/angular_router.dart';

const date = 'date';

class RoutePaths {
  static final today = RoutePath(path: 'today');

  static final schedule = RoutePath(path: 'schedule/:$date');
}

String getDateFromMap(Map<String, String> params) {
  final dateRoute = params[date];
  return dateRoute == null ? null : dateRoute;
}