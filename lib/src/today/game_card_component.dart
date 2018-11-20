import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:nhl/src/today/game.dart';
import 'package:nhl/src/api/API.dart';

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
class GameCardComponent implements OnInit {
  @Input() Game game;

  var homeTeamSvgUrl;
  var awayTeamSvgUrl;

  void ngOnInit () {
    homeTeamSvgUrl = API.getImageUrlFromTeamId(game.homeTeamId);
    awayTeamSvgUrl = API.getImageUrlFromTeamId(game.awayTeamId);
  }
}
