//
//  RestDataClient.swift
//  FCJ
//

import Alamofire

struct HTTPStatusCodes {
    public static let ok: Int = 200
    public static let badRequest: Int = 400
    public static let unathorizedRequest: Int = 401
    public static let notFound: Int = 404
    public static let internalServerError: Int = 500
    public static let serviceUnavailable: Int = 503
}

struct HTTPHeaderFields {
    public static let contentType = "Content-Type"
    public static let contentLength = "Content-Length"
    public static let authorization = "Authorization"
}

struct MIMETypes {
    public static let json = "application/json"
    public static let jpeg = "image/jpeg"
    public static let text = "text/plain"
}

struct ResponseKeys {
    static let DataKey: String = "data"
    static let ErrorsKey: String = "errors"
    static let MessageKey: String = "message"
}

class RestDataClient {
    
    var baseUrl: String = "https://fkj-server-v1.herokuapp.com/api"
    var teamBaseUrl: String = "https://fkj-server-v1.herokuapp.com/api/teams"
    
    var headers: HTTPHeaders {
        return [
            HTTPHeaderFields.contentType: MIMETypes.json
        ]
    }
    
//    var authorizationHeaders: HTTPHeaders {
//        return [
//            HTTPHeaderFields.contentType: MIMETypes.json,
//            HTTPHeaderFields.authorization: "Bearer \(self.token)"
//        ]
//    }
}

