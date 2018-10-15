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

  TodoListService() {
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
  }

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
