import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:random_string/random_string.dart';

@Component(
  selector: 'login',
  styleUrls: [
    'login.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  templateUrl: 'login.html',
  directives: [
    routerDirectives,
    coreDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
)

class LoginComponent implements OnActivate {
  final Router _router;

  Future<NavigationResult> goToToday () {
    String today = DateTime.now()
      .toIso8601String()
      .substring(0, 10);

    print('schedule/${today}');
   return _router.navigate('schedule/${today}');
  }

  Future<NavigationResult> goToGame () {
    // this the game ID for the WSH - NYR game on 2018-11-24
    String gameId = "2018020347";

    return _router.navigate('game/${gameId}/details');
  }

  Future<NavigationResult> goToReview () {
    // we make a review by creating a random UUID
    String reviewId = randomAlphaNumeric(16);
    String gameId = "2018020347";

    return _router.navigate('game/${gameId}/review/${reviewId}');
  }

  LoginComponent(this._router);

  @override
  void onActivate(RouterState previous, RouterState current) {
    // TODO: implement onActivate
  }
}