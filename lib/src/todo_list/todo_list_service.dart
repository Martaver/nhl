import 'dart:async';

import 'package:angular/core.dart';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<String> mockTodoList = <String>[];

  Future<List<String>> getTodoList() async => mockTodoList;

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

  Stream<QuerySnapshot> test() {

    return fb.firestore().collection('todos').get().asStream();
  }
}
