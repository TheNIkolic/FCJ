//
//  MatchRestDataClient.swift
//  FCJ
//

import Alamofire

extension RestDataClient {
    
    func createMatch(request: MatchRequest, successHandler: ((Match) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = matchBaseUrl
        
        AF.request(url.url!, method: .post, parameters: request.dictionary, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Match.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let match = response.value else { return }
                    
                    successHandler?(match)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func getAllMatches(successHandler: (([Match]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = matchBaseUrl
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: [Match].self, decoder: CustomDecoder()) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    print(response)
                    guard let matches = response.value else { return }
                    
                    successHandler?(matches)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func getSingleMatch(matchID: Int, successHandler: ((Match) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = matchBaseUrl + "/\(matchID)"
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Match.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let match = response.value else { return }
                    
                    successHandler?(match)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func editMatch(request: Match, successHandler: ((Match) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = matchBaseUrl
        
        AF.request(url.url!, method: .post, parameters: request.dictionary, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Match.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let match = response.value else { return }
                    
                    successHandler?(match)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func deleteMatch(matchID: Int, successHandler: ((String) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = matchBaseUrl + "/\(matchID)"
        
        AF.request(url.url!, method: .delete, parameters: matchID.dictionary, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    guard let responseMessage = response.value else { return }
                    
                    successHandler?(responseMessage)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func getNextMatch(successHandler: ((Match) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = matchBaseUrl + "/next-match"
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Match.self, decoder: CustomDecoder()) { (response) in
            
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let match = response.value else { return }
                    
                    successHandler?(match)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func getNextMatches(successHandler: (([Match]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = matchBaseUrl + "/next-matches"
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: [Match].self, decoder: CustomDecoder()) { (response) in
            
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let match = response.value else { return }
                    
                    successHandler?(match)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func getPreviousMatches(successHandler: (([Match]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = matchBaseUrl + "/previous-matches"
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: [Match].self, decoder: CustomDecoder()) { (response) in
            
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let match = response.value else { return }
                    
                    successHandler?(match)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
}
