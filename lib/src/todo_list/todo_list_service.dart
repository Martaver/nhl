import 'dart:async';

import 'package:angular/core.dart';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';

import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<String> mockTodoList = <String>[];

  Future<List<String>> getTodoList() async => mockTodoList;

  test() async {

    load();

    isEveryDefined([
      'FIREBASE_API_KEY',
      'FIREBASE_AUTH_DOMAIN',
      'FIREBASE_DATABASE_URL',
      'FIREBASE_STORAGE_BUCKET',
      'FIREBASE_PROJECT_ID',
      ]);

    try {
      fb.initializeApp(
          apiKey: env['FIREBASE_API_KEY'],
          authDomain: env['FIREBASE_AUTH_DOMAIN'],
          databaseURL: env['FIREBASE_DATABASE_URL'],
          storageBucket: env['FIREBASE_STORAGE_BUCKET'],
          projectId: env['FIREBASE_PROJECT_ID']);

      // MessagesApp().showMessages();
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
  }
}
