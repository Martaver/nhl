import 'game.dart';

class TodayListService {
  Future<List<Game>> getAll() async => [
    Game("NYR", "NYI", "7:00ET", "4-1"),
    Game("NYR", "NYI", "7:00ET", "4-1"),
    Game("NYR", "NYI", "7:00ET", "4-1"),
    Game("NYR", "NYI", "7:00ET", "4-1"),
  ];
}