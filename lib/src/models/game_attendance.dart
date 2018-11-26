
import 'package:firebase/firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_attendance.g.dart';

@JsonSerializable(nullable: false)
class GameAttendance {
  String gameId;
  String userId;
  
  // List fields required here, and add them to constructor too.
  String message;

  /**
   * The id of the team this user is supporting at the game they are attending.
   */
  String supportingTeamId;

  GameAttendance({this.gameId, this.userId, this.message, this.supportingTeamId});


  // The following are serializers for the object. JSON serialization is auto-generated.
  
  factory GameAttendance.fromJson(Map<String, dynamic> json) => _$GameAttendanceFromJson(json);
  
  Map<String, dynamic> toJson() => _$GameAttendanceToJson(this);

  factory GameAttendance.fromDoc(DocumentSnapshot doc) {
    GameAttendance item = _$GameAttendanceFromJson(doc.data());
    
    // The GameAttendance document's id is the userId.
    item.userId = doc.id;
    
    // The document containing this GameAttendance collection is the gameId.
    item.gameId = doc.ref.parent.parent.id;


    return item;
  }
}