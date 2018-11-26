import 'package:json_annotation/json_annotation.dart';
import 'game_details.dart';

part 'team_roster.g.dart';

@JsonSerializable(nullable: false)
class Player {
  Person person;
  Position position;

  Player({ this.person, this.position });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}



