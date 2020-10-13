//
//  ErrorResponse.swift
//  FCJ
//

class ErrorResponse: Codable {
    var timestamp: String = ""
    var status: Int = -1
    var error: String = ""
    var message: String = ""
    var path: String = ""
}

extension ErrorResponse {
    enum CodingKeys: String, CodingKey {
        case timestamp
        case status
        case error
        case message
        case path
    }
}
