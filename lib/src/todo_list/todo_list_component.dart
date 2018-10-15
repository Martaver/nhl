import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:firebase/src/firestore.dart';
import 'package:nhl/src/todo_list/todo_item.dart';
import 'package:rxdart/rxdart.dart';

import 'todo_list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [const ClassProvider(TodoListService)],
  pipes: [commonPipes],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;

  String newTodo = '';

  Observable<List<TodoItem>> todos;

  TodoListComponent(this.todoListService);

  @override
  ngOnInit() {

    this.todos = todoListService.test();
  }

  Future add() async {
    await todoListService.add(newTodo);
  }

  Future remove(String id) async {
    await todoListService.remove(id);
  }
}
