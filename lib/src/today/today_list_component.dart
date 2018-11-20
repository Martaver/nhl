import 'package:angular/angular.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/app_layout/material_temporary_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';
import 'package:nhl/src/today/game_card_component.dart';
import 'package:nhl/src/today/today_list_service.dart';
import 'game.dart';

@Component(
  selector: 'today-list',
  styleUrls: [
    'today_list_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'today_list_component.html',
  directives: [
    coreDirectives,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialTemporaryDrawerComponent,
    MaterialToggleComponent,
    GameCardComponent,
  ],
  providers: [ClassProvider(TodayListService)],
)

class TodayListComponent implements OnInit {
  final DateTime date = new DateTime.now();
  final TodayListService _todayListService;
  List<Game> games;

  TodayListComponent(this._todayListService);

  Future<void> _getGames() async {
    games = await _todayListService.getAll();
  }

  void ngOnInit () => _getGames();
}
