// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_roster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
      position: Position.fromJson(json['position'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlayerToJson(Player instance) =>
    <String, dynamic>{'person': instance.person, 'position': instance.position};
