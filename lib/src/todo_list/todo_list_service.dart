import 'dart:async';

import 'package:angular/core.dart';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';
import 'package:nhl/src/todo_list/todo_item.dart';
import 'package:rxdart/rxdart.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<String> mockTodoList = <String>[];

  Observable<List<TodoItem>> test() {

    return new Observable(fb.firestore().collection('todos').onSnapshot)
      .doOnEach(print)
      .map((snapshot) => snapshot.docs.map((doc) => TodoItem.fromDoc(doc)).toList())
      .shareValue();
  }

  Future add(String message) {
    return fb.firestore().collection('todos').add({'message': message});
  }

  Future remove(String id) {
    return fb.firestore().collection('todos').doc(id.toString()).delete();
  }
}
