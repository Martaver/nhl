import 'dart:async';

import 'package:angular/core.dart';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';
import 'package:nhl/src/models/game_review.dart';
import 'package:nhl/src/services/constants.dart';
import 'package:rxdart/rxdart.dart';



/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class GameReviewService {

  CollectionReference ReviewsFor(String gameId) => fb.firestore().collection(COLLECTION_GAME).doc(gameId).collection(COLLECTION_GAME_REVIEW);

  /**
   * Adds a new review to a game, returning the review's new id.
   */
  Future<String> add(String gameId, GameReview gameReview) async {
    
    var json = gameReview.toJson();
    var doc = await ReviewsFor(gameId).add(json);
    return doc.id;
  }

  /**
   * Updates the values of a review for a game by its id, if it exists.
   */
  Future update(String gameId, GameReview gameReview) async {
    
    if(gameReview.id == null) {
      print("'gameReview' doesn't have an id. Assuming it's new, so ignoring the call to update.");
      return;
    }

    var json = gameReview.toJson();
    ReviewsFor(gameId).doc(gameReview.id).set(json);
    return;
  }

  /**
   * Removes a review from a game by its id.
   */
  Future remove(String gameId, String reviewId) {

    return ReviewsFor(gameId).doc(reviewId).delete();
  }

  /**
   * Gets all reviews for a game.
   */
  Future<List<GameReview>> all(String gameId) async {

    var snapshot = await ReviewsFor(gameId).get();
    return snapshot.docs.map((doc) => GameReview.fromDoc(doc)).toList();    
  }

  /**
   * Gets a stream of all reviews for a game. The stream emits a list of all reviews, and updates
   * when new reviews are added, updated or removed.
   * 
   * This can be subscribed to the same as a Future, using the Async pipe in your component.
   */
  Observable<List<GameReview>> all$(String gameId) {

    return new Observable(ReviewsFor(gameId).onSnapshot)
      // .doOnEach(print)
      .map((snapshot) => snapshot.docs.map((doc) => GameReview.fromDoc(doc)).toList())
      .shareValue();
  }
}
