import 'game.dart';
import 'dart:async';
import 'package:nhl/src/api/Games.dart';

class TodayListService {
  String now = DateTime.now().toIso8601String().substring(0, 10);
  DateTime today = DateTime.now();

  Future<List<Game>> getAll() async => fetchGamesByDate(now);


  Future<List<Game>> getGamesByDate(String date) async => fetchGamesByDate(date);
}