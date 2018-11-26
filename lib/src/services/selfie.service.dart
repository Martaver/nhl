import 'dart:html';
import 'package:angular/core.dart';
import 'package:firebase/firebase.dart';

import 'package:firebase/firebase.dart' as fb;

@Injectable()
class SelfieService {

  final fb.StorageReference storageRef = fb.storage().ref("selfies");

  /**
   * Get detailed game data from the ID of the game
   */
  UploadTask save(String reviewId, Blob blob) => storageRef.child(reviewId).put(blob); 

  /**
   * Get the Uri for the selfie taken for the review specified by 'reviewId'.
   * Returns null if no selfie was taken for the review.
   */
  Future<Uri> getUrl(String reviewId) async {
   try {
     return storageRef.child(reviewId).getDownloadURL();
   } 
   catch(e) {
     return await null;
   }
  }
}