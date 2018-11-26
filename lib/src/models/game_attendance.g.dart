// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameAttendance _$GameAttendanceFromJson(Map<String, dynamic> json) {
  return GameAttendance(
      gameId: json['gameId'] as String,
      userId: json['userId'] as String,
      message: json['message'] as String,
      supportingTeamId: json['supportingTeamId'] as String);
}

Map<String, dynamic> _$GameAttendanceToJson(GameAttendance instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'userId': instance.userId,
      'message': instance.message,
      'supportingTeamId': instance.supportingTeamId
    };
