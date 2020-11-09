//
//  CompetitionDataProvider.swift
//  FCJ
//

extension DataProvider {
    func createCompetition(request: CompetitionRequest, successHandler: ((Competition) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.createCompetition(request: request, successHandler: successHandler, failHandler: failHandler)
    }
    
    func getAllCompetitions(successHandler: (([Competition]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.getAllCompetitions(successHandler: successHandler, failHandler: failHandler)
    }
    
    func getSingleCompetition(competitionID: Int, successHandler: ((Competition) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.getSingleCompetition(competitionID: competitionID, successHandler: successHandler, failHandler: failHandler)
    }
    
    func editCompetition(request: Competition, successHandler: ((Competition) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.editCompetition(request: request, successHandler: successHandler, failHandler: failHandler)
    }
    
    func deleteCompetition(competitionID: Int, successHandler: ((String) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.deleteCompetition(competitionID: competitionID, successHandler: successHandler, failHandler: failHandler)
    }
}
