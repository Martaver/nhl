import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'game-card',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
  templateUrl: 'game_card_component.html',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'game_card_component.css',
  ],
)
class GameCardComponent {
  final String team1;
  final String team2;
  final String timeOfGame;
  final String score;
  final GameCardComponent game;

  GameCardComponent(this.team1, this.team2, this.timeOfGame, this.score);
}