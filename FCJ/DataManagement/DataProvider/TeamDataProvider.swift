//
//  TeamDataProvider.swift
//  FCJ
//

extension DataProvider {
    func createTeam(request: TeamRequest, successHandler: ((Team) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.createTeam(request: request, successHandler: successHandler, failHandler: failHandler)
    }
    
    func getAllTeams(successHandler: (([Team]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.getAllTeams(successHandler: successHandler, failHandler: failHandler)
    }
    
    func getSingleTeam(teamID: Int, successHandler: ((Team) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.getSingleTeam(teamID: teamID, successHandler: successHandler, failHandler: failHandler)
    }
    
    func editTeam(request: Team, successHandler: ((Team) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.editTeam(request: request, successHandler: successHandler, failHandler: failHandler)
    }
    
    func deleteTeam(teamID: Int, successHandler: ((String) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.deleteTeam(teamID: teamID, successHandler: successHandler, failHandler: failHandler)
    }
}
