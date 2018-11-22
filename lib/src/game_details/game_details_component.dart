import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/router/game/game_routes.dart';

@Component(
  selector: 'game-detials',
  styleUrls: [
    'game_details_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'game_details_component.html',
  directives: [
    routerDirectives,
    coreDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
  exports: [RoutePaths, Routes],
)

class GameDetailsComponent implements OnActivate {


  void onActivate(_, RouterState current) {
    // TODO implement this.
    // get the game ID from the route

    // then fetch the detailed game data.

    // also needs to pull reviews from firebase for this game (if there is any).
  }

}