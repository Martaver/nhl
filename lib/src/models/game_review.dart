
import 'package:firebase/firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_review.g.dart';

@JsonSerializable(nullable: false)
class GameReview {
  String id;
  
  // List fields required here, and add them to constructor too.
  String message;
  int rating;
  bool hasSelfie;


  GameReview({this.id, this.message, this.rating, this.hasSelfie});


  // The following are serializers for the object. JSON serialization is auto-generated.
  
  factory GameReview.fromJson(Map<String, dynamic> json) => _$GameReviewFromJson(json);
  
  Map<String, dynamic> toJson() => _$GameReviewToJson(this);

  factory GameReview.fromDoc(DocumentSnapshot doc) {
    GameReview item = _$GameReviewFromJson(doc.data());
    item.id = doc.id;
    return item;
  }
}