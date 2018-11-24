import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/models/game_review.dart';
import 'package:nhl/src/services/game_review.service.dart';

@Component(
  selector: 'game-review',
  styleUrls: [
    'game_review_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'game_review_component.html',
  directives: [
    coreDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
  providers: [const ClassProvider(GameReviewService)],
)

class GameReviewComponent implements OnActivate {
  
  final GameReviewService gameReviewService;

  GameReviewComponent(this.gameReviewService);

  /**
   * The id of the game we are adding this review to. Set this in onActivate, it will be used in 'submit' and 'delete'.
   */
  String gameId;

  /**
   * Bind controls to fields on this review object, it will be saved when 'submit' is called.
   */
  GameReview review = new GameReview();


  void onActivate(_, RouterState current) async {
    // TODO implement this.
    
    // get the game ID from the route
    this.gameId = "xyz";
    // print(gameId);

    // we can assume that every review is a new one (we won't allow editing reviews).

    // so in which case implement an onsubmit and then this will post to firebase the review.
    
  }

  /**
   * Submits the review, saving it to firebase.
   */
  Future<String> submit() async {    
    return await this.gameReviewService.add(this.gameId, this.review);
    // Push route back to game?
  }

  /**
   * Removes the review and returns to game view.
   */
  Future<void> delete() async {
    // Remove the game from firebase.    
    await this.gameReviewService.remove(this.gameId, this.gameId);
    // Push route back to game.
  }

}