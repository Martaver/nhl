import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:firebase_dart_ui/firebase_dart_ui.dart';
import 'package:firebase/firebase.dart' as fb;
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
    FirebaseAuthUIComponent,
  ],
)

class LoginComponent implements OnActivate {
  final Router _router;
  UIConfig _uiConfig;

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

  Future<Null> logout() async {
    await fb.auth().signOut();
    providerAccessToken = "";
  }

  bool signInSuccessWithAuthResult(fb.UserCredential authResult, _) {
    print(authResult);
    return false;
  }

  UIConfig getUIConfig() {
    if (_uiConfig == null) {
      var googleOptions = new CustomSignInOptions(
          provider: fb.GoogleAuthProvider.PROVIDER_ID,
          scopes: ['email', 'https://www.googleapis.com/auth/plus.login'],
          customParameters:
          new GoogleCustomParameters(prompt: 'select_account'));

      var callbacks = new Callbacks(
          // uiShown: () => print("UI shown callback"),          
          signInSuccess: signInSuccessWithAuthResult
          // signInFailure: signInFailure
      );

      _uiConfig = new UIConfig(
          signInSuccessUrl: '/',
          signInOptions: [
            fb.FacebookAuthProvider.PROVIDER_ID,
            fb.TwitterAuthProvider.PROVIDER_ID,
            googleOptions,
            fb.EmailAuthProvider.PROVIDER_ID
          ],
          signInFlow: "redirect",
          credentialHelper: ACCOUNT_CHOOSER,
          tosUrl: '/tos.html',
          callbacks: callbacks);
    }
    return _uiConfig;
  }

  bool isAuthenticated() => fb.auth().currentUser != null;
  String get userEmail => fb.auth().currentUser?.email;
  String get displayName => fb.auth().currentUser?.displayName;
  Map<String, dynamic> get userJson => fb.auth().currentUser?.toJson();
  String providerAccessToken = '';

  LoginComponent(this._router);

  @override
  void onActivate(RouterState previous, RouterState current) {
    // TODO: implement onActivate
  }
}