import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input_multiline.dart';
import 'package:angular_components/material_progress/material_progress.dart';
import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/models/game_review.dart';
import 'package:nhl/src/photo_booth/photo_booth_component.dart';
import 'package:nhl/src/services/game_review.service.dart';
import 'package:nhl/src/services/selfie.service.dart';



@Component(
  selector: 'game-review',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'game_review_component.css',
  ],
  templateUrl: 'game_review_component.html',
  directives: [
    coreDirectives,
    routerDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialMultilineInputComponent,
    MaterialProgressComponent,
    PhotoBoothComponent
  ],
  providers: [const ClassProvider(GameReviewService), const ClassProvider(SelfieService)],
)

class GameReviewComponent implements OnActivate {

  final GameReviewService gameReviewService;
  final SelfieService selfieService;  
  final Router _router;
  final Location _location;

  GameReviewComponent(this.gameReviewService, this.selfieService, this._location, this._router);

  /**
   * The id of the game we are adding this review to. Set this in onActivate, it will be used in 'submit' and 'delete'.
   */
  String gameId;

  /**
   * The id of the review itself. Set this in onActivate
   * This should be the ID of the doc that we're using in firebase, if possible.
   */
  String reviewId;

  /**
   * Bind controls to fields on this review object, it will be saved when 'submit' is called.
   */
  GameReview review = new GameReview();

  @ViewChild(PhotoBoothComponent) PhotoBoothComponent photoBooth;
  
  GotSnapshotEvent selfieSnapshot;

  bool isGettingSelfie = false;  
  bool hasSelfie = false;
  bool confirming = false;
  bool submitting = false;
  int rating = 0;

  void onActivate(_, RouterState current) async {
    // get the game ID from the route
    gameId = current.parameters['gameid'];
    reviewId = current.parameters['reviewid'];
  }

  /**
   * Submits the review, saving it to firebase.
   * Navigate back to game details view
   */
  Future<NavigationResult> submit() async {
    submitting = true;
    var reviewId = await this.gameReviewService.add(this.gameId, this.review);
    if(selfieSnapshot != null) {
      await this.selfieService.save(reviewId, selfieSnapshot.blob).future;
    }
    submitting = false;
    return _router.navigate('game/$gameId/details');
  }

  /**
   * Removes the review and returns to game view.
   */
  Future<void> delete() async {
    // Remove the game from firebase.    
    await this.gameReviewService.remove(this.gameId, this.gameId);
    // Push route back to game.
  }

  void getSelfie() {
    isGettingSelfie = true;
    confirming = false;
  }

  void takeSelfie() {
    photoBooth.snapshot();
  }

  void clearSelfie() {
    hasSelfie = false;
    selfieSnapshot = null;
    confirming = false;
  }

  void confirmSelfie() {
    confirming = false;
  }

  void onReviewChange(String text) {
    review.message = text;
  }

  void setRating(int r) {
    rating = r;
    review.rating = r;
  }

  void goBack() => _location.back();

  onGotSnapshot(GotSnapshotEvent event) async {
    selfieSnapshot = event;
    isGettingSelfie = false;    
    hasSelfie = true;
    confirming = true;
  }

}