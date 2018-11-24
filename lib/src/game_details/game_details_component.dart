import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/models/game_review.dart';
import 'package:nhl/src/router/game/game_routes.dart';
import 'package:nhl/src/services/game_review.service.dart';

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
    NgFor
  ],
  exports: [RoutePaths, Routes],
  providers: [const ClassProvider(GameReviewService)],
  pipes: [commonPipes],
)

class GameDetailsComponent implements OnActivate {

  final GameReviewService gameReviewService;

  GameDetailsComponent(this.gameReviewService);

  Future<List<GameReview>> reviews;

  void onActivate(_, RouterState current) {
    // TODO implement this.
    // get the game ID from the route

    // then fetch the detailed game data.    
    
    // pull reviews from firebase for this game (if there is any).
    this.reviews = this.gameReviewService.all("xyz");
  }

}