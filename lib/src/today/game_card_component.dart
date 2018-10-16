import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
//import 'package:angular_gallery_section/annotation/gallery_section_config.dart';
//
//@GallerySectionConfig(
//  displayName: 'Material Card',
//  docs: ['package:angular_components/material_card/README.md'],
//  demos: [MaterialCardExample],
//  showGeneratedDocs: true,
//  relatedUrls: {
//    'Material Spec': 'https://material.io/design/components/cards.html',
//  },
//)
//class MaterialButtonGalleryConfig {}

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
class GameCardComponent {}

class Game {
  final int id;
  String team1;
  String team2;

  Game(this.id, this.team1, this.team2);
}
