//
//  Match.swift
//  FCJ
//

import Foundation

class Match: Codable {
    
    var id: Int = 0
    var competition: Competition = Competition()
    var season: String = ""
    var stage: String = ""
    var homeTeam: Team = Team()
    var homeTeamScore: Int?
    var awayTeam: Team = Team()
    var awayTeamScore: Int?
    var result: Int?
    var kickOffDate: Date = Date()
    var location: String = ""
}

extension Match {
    enum CodingKeys: String, CodingKey {
        case id
        case competition
        case season
        case stage
        case homeTeam
        case homeTeamScore
        case awayTeam
        case awayTeamScore
        case result
        case kickOffDate
        case location
    }
}
