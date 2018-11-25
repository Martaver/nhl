import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input_multiline.dart';
import 'package:angular_router/angular_router.dart';
import 'package:nhl/src/models/game_review.dart';
import 'package:nhl/src/photo_booth/photo_booth_component.dart';
import 'package:nhl/src/services/game_review.service.dart';

import 'package:firebase/firebase.dart' as fb;


@Component(
  selector: 'game-review',
  styleUrls: [
    'game_review_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'game_review_component.html',
  directives: [
    coreDirectives,
    routerDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialMultilineInputComponent,
    PhotoBoothComponent
  ],
  providers: [const ClassProvider(GameReviewService)],
)

class GameReviewComponent implements OnActivate {
  
  final GameReviewService gameReviewService;
  final Router _router;

  GameReviewComponent(this.gameReviewService, this._router);

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
    await this.gameReviewService.add(this.gameId, this.review);
    return _router.navigate('$gameId/details');
  }

  /**
   * Removes the review and returns to game view.
   */
  Future<void> delete() async {
    // Remove the game from firebase.    
    await this.gameReviewService.remove(this.gameId, this.gameId);
    // Push route back to game.
  }

  final fb.StorageReference storageRef = fb.storage().ref("snapshots");

  onGotSnapshot(GotSnapshotEvent event) async {
        
    var snapshot = await storageRef.child('test').put(event.blob).future;
  }

}