#' Get box score for specified game ID
#' @importFrom  pipeR %>>%
#' @export
#' @param gameID A ten digit game ID. The first 4 digits identify the season of the game (ie. 2017 for the 2017-2018 season). The next 2 digits give the type of game, where 01 = preseason, 02 = regular season, 03 = playoffs, 04 = all-star. The final 4 digits identify the specific game number. For regular season and preseason games, this ranges from 0001 to the number of games played. (1271 for seasons with 31 teams (2017 and onwards) and 1230 for seasons with 30 teams). For playoff games, the 2nd digit of the specific number gives the round of the playoffs, the 3rd digit specifies the matchup, and the 4th digit specifies the game (out of 7).
#' @return The box score for the specified \code{gameID}. Returned as a list.
#' @examples
#' get_boxscore(gameID = 2017030111)

get_boxscore <- function(gameID = NULL) {
  if (is.null(gameID)) {
    stop("Game ID must be specified")
  }

  endpointURL <- paste0("https://statsapi.web.nhl.com/api/v1/game/",
                        as.character(gameID), "/boxscore")
  response <- httr::GET(url = endpointURL)
  cont <- content(response) %>>% list.remove("copyright")

  return(cont)
}

#' Get line score for specified game ID
#' @importFrom  pipeR %>>%
#' @export
#' @param gameID A ten digit game ID. The first 4 digits identify the season of the game (ie. 2017 for the 2017-2018 season). The next 2 digits give the type of game, where 01 = preseason, 02 = regular season, 03 = playoffs, 04 = all-star. The final 4 digits identify the specific game number. For regular season and preseason games, this ranges from 0001 to the number of games played. (1271 for seasons with 31 teams (2017 and onwards) and 1230 for seasons with 30 teams). For playoff games, the 2nd digit of the specific number gives the round of the playoffs, the 3rd digit specifies the matchup, and the 4th digit specifies the game (out of 7).
#' @return The line score for the specified \code{gameID}. Returned as a list.
#' @examples
#' get_linescore(gameID = 2017030111)

get_linescore <- function(gameID = NULL) {
  if (is.null(gameID)) {
    stop("Game ID must be specified")
  }

  endpointURL <- paste0("https://statsapi.web.nhl.com/api/v1/game/",
                        as.character(gameID), "/linescore")
  response <- httr::GET(url = endpointURL)
  cont <- content(response)
  return(cont)
}
