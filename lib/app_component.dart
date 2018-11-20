import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'src/todo_list/todo_list_component.dart';
import 'src/today/today_list_component.dart';
import 'src/router/routes.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    TodoListComponent,
    TodayListComponent,
    routerDirectives,
  ],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
