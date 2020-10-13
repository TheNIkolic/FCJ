//
//  TeamRestDataClient.swift
//  FCJ
//

import Alamofire

extension RestDataClient {
    
    func createTeam(request: TeamRequest, successHandler: ((Team) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = teamBaseUrl
        
        AF.request(url.url!, method: .post, parameters: request.dictionary, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Team.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let team = response.value else { return }
                    
                    successHandler?(team)
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
    
    func getAllTeams(successHandler: (([Team]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = teamBaseUrl
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: [Team].self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let teams = response.value else { return }
                    
                    successHandler?(teams)
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
    
    func getSingleTeam(teamID: Int, successHandler: ((Team) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = teamBaseUrl + "\(teamID)"
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Team.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let team = response.value else { return }
                    
                    successHandler?(team)
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
    
    func editTeam(request: Team, successHandler: ((Team) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = teamBaseUrl
        
        AF.request(url.url!, method: .post, parameters: request.dictionary, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Team.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let team = response.value else { return }
                    
                    successHandler?(team)
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
    
    func deleteTeam(teamID: Int, successHandler: ((String) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = teamBaseUrl + "\(teamID)"
        
        AF.request(url.url!, method: .delete, parameters: teamID.dictionary, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
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
