//
//  MatchDataProvider.swift
//  FCJ
//

extension DataProvider {
    func createMatch(request: MatchRequest, successHandler: ((Match) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.createMatch(request: request, successHandler: successHandler, failHandler: failHandler)
    }
    
    func getAllMatches(successHandler: (([Match]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.getAllMatches(successHandler: successHandler, failHandler: failHandler)
    }
    
    func getSingleMatch(matchID: Int, successHandler: ((Match) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.getSingleMatch(matchID: matchID, successHandler: successHandler, failHandler: failHandler)
    }
    
    func editMatch(request: Match, successHandler: ((Match) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.editMatch(request: request, successHandler: successHandler, failHandler: failHandler)
    }
    
    func deleteMatch(matchID: Int, successHandler: ((String) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.deleteMatch(matchID: matchID, successHandler: successHandler, failHandler: failHandler)
    }
    
    func getNextMatch(successHandler: ((Match) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.getNextMatch(successHandler: successHandler, failHandler: failHandler)
    }
}
