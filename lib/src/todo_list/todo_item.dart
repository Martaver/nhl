
import 'package:firebase/firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_item.g.dart';

@JsonSerializable(nullable: false)
class TodoItem {
  String id;
  String message;

  TodoItem({this.id, this.message});
  factory TodoItem.fromJson(Map<String, dynamic> json) => _$TodoItemFromJson(json);
  Map<String, dynamic> toJson() => _$TodoItemToJson(this);

  factory TodoItem.fromDoc(DocumentSnapshot doc) {
    TodoItem item = _$TodoItemFromJson(doc.data());
    item.id = doc.id;
    return item;
  }
}