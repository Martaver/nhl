import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
// import 'package:firebase/firebase.dart';
import 'package:firebase_dart_ui/firebase_dart_ui.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/src/interop/firebase_interop.dart';
import 'package:js/js.dart';
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


  UIConfig _uiConfig;

  Future<Null> logout() async {
    await fb.auth().signOut();
    providerAccessToken = "";
  }

  // todo: We need to create a nicer wrapper for the sign in callbacks.
  PromiseJsImpl<void>  signInFailure(AuthUIError authUiError) {
    // nothing to do;
    return new PromiseJsImpl<void>( () => print("SignIn Failure"));
  }

  // Example SignInSuccess callback handler
  bool signInSuccess(Object user, Object authCredential, String redirectUrl) {
//    print("sign in  success. ProviderID =  ${authResult.credential.providerId}");
//    print("Info= ${authResult.additionalUserInfo}");

    print(user);
    print(authCredential);

    return false;
  }

  /// Your Application must provide the UI configuration for the
  /// AuthUi widget. This is where you configure the providers and options.
  UIConfig getUIConfig() {
    if (_uiConfig == null) {
      var googleOptions = new CustomSignInOptions(
          provider: fb.GoogleAuthProvider.PROVIDER_ID,
          scopes: ['email', 'https://www.googleapis.com/auth/plus.login'],
          customParameters:
          new GoogleCustomParameters(prompt: 'select_account'));

      var gitHub = new CustomSignInOptions(
          provider: fb.GithubAuthProvider.PROVIDER_ID,
          // sample below of asking for additional scopes.
          // See https://developer.github.com/apps/building-oauth-apps/scopes-for-oauth-apps/
          scopes: [/*'repo', 'gist' */]);


      var callbacks = new Callbacks(
          uiShown: () => print("UI shown callback"),
          signInSuccess: allowInterop(signInSuccess),
          signInFailure: signInFailure
      );


      _uiConfig = new UIConfig(
          signInSuccessUrl: '/',
          signInOptions: [
            fb.PhoneAuthProvider.PROVIDER_ID,
            fb.FacebookAuthProvider.PROVIDER_ID,
            fb.TwitterAuthProvider.PROVIDER_ID,
            googleOptions,
            fb.EmailAuthProvider.PROVIDER_ID
          ],
          signInFlow: "redirect",
          //signInFlow: "popup",
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

  // If the provider gave us an access token, we put it here.
  String providerAccessToken = '';

  LoginComponent(this._router);

  @override
  void onActivate(RouterState previous, RouterState current) {
    // TODO: implement onActivate
  }
}