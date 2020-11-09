//
//  MatchRequest.swift
//  FCJ
//

import Foundation

class MatchRequest: Codable {
    
    var competition: Competition = Competition()
    var season: String = ""
    var stage: String = ""
    var homeTeam: Team = Team()
    var homeTeamScore: Int = 0
    var awayTeam: Team = Team()
    var awayTeamScore: Int = 0
    var result: Int = 0
    var kickOffDate: String = ""
    var location: String = ""
}
