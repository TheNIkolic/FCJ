//
//  CustomDecoder.swift
//  FCJ
//

import Foundation

class CustomDecoder: JSONDecoder {
    let dateFormatter = DateFormatter()

    override init() {
        super.init()
        dateDecodingStrategy = .iso8601
    }
}
