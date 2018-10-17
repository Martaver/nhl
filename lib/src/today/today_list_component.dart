import 'package:angular/angular.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/app_layout/material_temporary_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';
import 'package:nhl/src/today/game_card_component.dart';

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
  ]
)

class TodayListComponent {
  final DateTime date = new DateTime.now();
  List<GameCardComponent> games = [
    new GameCardComponent("NYR", "NYI", "7:00ET", "4-1"),
    new GameCardComponent("NYR", "NYI", "7:00ET", "4-1"),
    new GameCardComponent("NYR", "NYI", "7:00ET", "4-1"),
    new GameCardComponent("NYR", "NYI", "7:00ET", "4-1"),
  ];

  GameCardComponent get myGameCardComponent => games.first;

}