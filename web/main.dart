import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:nhl/app_component.template.dart' as ng;

import 'main.template.dart' as self;
import 'package:firebase/firebase.dart' as fb;

@GenerateInjector(
  routerProvidersHash, // You can use routerProviders in production
)
final InjectorFactory injector = self.injector$Injector;

void main() {
  try {
      fb.initializeApp(
          apiKey: "AIzaSyBxFVTF94tdRPW9QFIAi7oPVun__AbPYVo",
          authDomain: "nhlapp-8ad23.firebaseapp.com",
          databaseURL: "https://nhlapp-8ad23.firebaseio.com",
          storageBucket: "nhlapp-8ad23.appspot.com",
          projectId: "nhlapp-8ad23",
          messagingSenderId: "1021216818424"
          );

      // MessagesApp().showMessages();
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
