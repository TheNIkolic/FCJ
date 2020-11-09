//
//  Competition.swift
//  FCJ
//

class Competition: Codable {
    
    var id: Int = 0
    var name: String = ""
    var imageUrl: String = ""
    var stageName: String = ""
}

extension Competition {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl
        case stageName
    }
}
