import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:nhl/src/router/game/game_routes.dart';

@Component(
  selector: 'game-container',
  template: '''
  <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  exports: [Routes, RoutePaths],
  directives: [routerDirectives],
)
class GameContainer {}