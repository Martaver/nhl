String matchTeamNameToAbbreviation(String fullName) {
  switch(fullName) {
    case "Anaheim Ducks": { return "ANA"; }
    case "Arizona Coyotes": { return "ARI"; }
    case "Boston Bruins": { return "BOS"; }
    case "Buffalo Sabres": { return "BUF"; }
    case "Carolina Hurricanes": { return "CAR"; }
    case "Calgary Flames": { return "CGY"; }
    case "Chicago Blackhawks": { return "CHI"; }
    case "Columbus Blue Jackets": { return "CBJ"; }
    case "Colorado Avalanche": { return "COL"; }
    case "Dallas Stars": { return "DAL"; }
    case "Detroit Red Wings": { return "DET"; }
    case "Edmonton Oilers": { return "EDM"; }
    case "Florida Panthers": { return "FLA"; }
    case "Los Angeles Kings": { return "LAK"; }
    case "Minnesota Wild": { return "MIN"; }
    case "Montréal Canadiens":
    case "Montreal Canadiens": { return "MTL"; }
    case "Nashville Predators": { return "NSH"; }
    case "New Jersey Devils": { return "NJD"; }
    case "New York Islanders": { return "NYI"; }
    case "New York Rangers": { return "NYR"; }
    case "Ottawa Senators": { return "OTT"; }
    case "Philadelphia Flyers": { return "PHI"; }
    case "Pittsburgh Penguins": { return "PIT"; }
    case "San Jose Sharks": { return "SJS"; }
    case "St. Louis Blues":
    case "St Louis Blues": { return "STL"; }
    case "Tampa Bay Lightning": { return "TBL"; }
    case "Toronto Maple Leafs": { return "TOR"; }
    case "Vancouver Canucks": { return "VAN"; }
    case "Vegas Golden Knights": { return "VGK"; }
    case "Washington Capitals": { return "WSH"; }
    case "Winnipeg Jets": { return "WPG"; }
    default: { return fullName; }
  }
}