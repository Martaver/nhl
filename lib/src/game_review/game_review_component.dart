import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'game-review',
  styleUrls: [
    'game_review_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'game_review_component.html',
  directives: [
    coreDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
)

class GameReviewComponent implements OnActivate {


  void onActivate(_, RouterState current) {
    // TODO implement this.
    // get the game ID from the route

    // get the review ID from the route.

    // we can assume that every review is a new one (we won't allow editing reviews).

    // so in which case implement an onsubmit and then this will post to firebase the review.
  }

}