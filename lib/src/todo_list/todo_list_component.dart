import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:firebase/src/firestore.dart';

import 'todo_list_service.dart';

class TodoItem {
  String message;

  TodoItem(Map<String, dynamic> values) {
    this.message = values['message'];
  }
}

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

  List<String> items = [];
  String newTodo = '';

  Stream<Iterable<TodoItem>> todos;

  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
    
    this.todos = todoListService.test().map((snapshot) => snapshot.docs.map((doc) => new TodoItem(doc.data())));
  }

  void add() {
    items.add(newTodo);
    newTodo = '';
  }

  String remove(int index) => items.removeAt(index);
}
