class Game {
  final int id;
  final String homeTeamName;
  final String homeTeamNameAbbr;
  final int homeTeamId;
  final int homeTeamScore;
  final String awayTeamName;
  final String awayTeamNameAbbr;
  final int awayTeamId;
  final int awayTeamScore;
  final DateTime timeOfGame;
  final String gameState;

  Game(
      this.id,
      this.homeTeamName,
      this.homeTeamNameAbbr,
      this.homeTeamId,
      this.homeTeamScore,
      this.awayTeamName,
      this.awayTeamNameAbbr,
      this.awayTeamId,
      this.awayTeamScore,
      this.timeOfGame,
      this.gameState,
      );
}
