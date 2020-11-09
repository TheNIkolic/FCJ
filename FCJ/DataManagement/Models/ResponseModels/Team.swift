//
//  Team.swift
//  FCJ
//

class Team: Codable {
    
    var id: Int = 0
    var name: String = ""
    var imageUrl: String = ""
    var homeTown: String = ""
}

extension Team {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl
        case homeTown
    }
}
