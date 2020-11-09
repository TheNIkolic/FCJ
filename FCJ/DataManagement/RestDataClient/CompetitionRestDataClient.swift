//
//  CompetitionRestDataClient.swift
//  FCJ
//

import Alamofire

extension RestDataClient {
    
    func createCompetition(request: CompetitionRequest, successHandler: ((Competition) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = competitionBaseUrl
        
        AF.request(url.url!, method: .post, parameters: request.dictionary, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Competition.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let competition = response.value else { return }
                    
                    successHandler?(competition)
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
    
    func getAllCompetitions(successHandler: (([Competition]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = competitionBaseUrl
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: [Competition].self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let competitions = response.value else { return }
                    
                    successHandler?(competitions)
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
    
    func getSingleCompetition(competitionID: Int, successHandler: ((Competition) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = competitionBaseUrl + "/\(competitionID)"
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Competition.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let competition = response.value else { return }
                    
                    successHandler?(competition)
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
    
    func editCompetition(request: Competition, successHandler: ((Competition) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = competitionBaseUrl
        
        AF.request(url.url!, method: .post, parameters: request.dictionary, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Competition.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let competition = response.value else { return }
                    
                    successHandler?(competition)
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
    
    func deleteCompetition(competitionID: Int, successHandler: ((String) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = competitionBaseUrl + "/\(competitionID)"
        
        AF.request(url.url!, method: .delete, parameters: competitionID.dictionary, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
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
}
