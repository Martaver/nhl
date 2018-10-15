// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) {
  return TodoItem(id: json['id'] as String, message: json['message'] as String);
}

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) =>
    <String, dynamic>{'id': instance.id, 'message': instance.message};
