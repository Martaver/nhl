class API {
  static final String baseUrl = "http://statsapi.web.nhl.com/api/v1";
  static final String schedule = "/schedule";
  static String getGamePathFromId (String gameId) => "/game/$gameId/feed/live";
  static String getRosterPathFromId (String rosterId) => "/teams/$rosterId/roster";
  static String getImageUrlFromTeamId(int id) =>
  "https://www-league.nhlstatic.com/builds/site-core/" +
  "01c1bfe15805d69e3ac31daa090865845c189b1d_1458063644/images/team/logo/current/"
  + id.toString() + "_dark.svg";
}