import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:nhl/src/models/game.dart';
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
  final Router _router;

  @Input() Game game;

  var homeTeamSvgUrl;
  var awayTeamSvgUrl;

  GameCardComponent(this._router);

  Future<NavigationResult> goToDetailedGameView() =>
      _router.navigate('game/${game.id}/details');

  void ngOnInit () {
    homeTeamSvgUrl = API.getImageUrlFromTeamId(game.homeTeamId);
    awayTeamSvgUrl = API.getImageUrlFromTeamId(game.awayTeamId);
  }
}
