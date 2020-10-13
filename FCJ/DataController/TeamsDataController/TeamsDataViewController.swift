//
//  TeamsDataViewController.swift
//  FCJ
//

import UIKit



class TeamsDataViewController: BaseViewController {
    
    private let addTeamButton: FCJButton = FCJButton()
    private let addTeamView: AddTeamView = AddTeamView()
    private let teamEditDataView: TeamEditDataView = TeamEditDataView()
    private let teamsTableView: TeamsTableView = TeamsTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        addAddTeamButton()
        addTeamsTableView()
        
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Manage Teams Data"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white , NSAttributedString.Key.font: UIFont.fcjBoldFont(ofSize: FontSize.regular)!]
        navigationItem.rightBarButtonItem?.title = ""
        
        addTeamView.frame = CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        addTeamView.isHidden = true
        addTeamView.delegate = self
        navigationController?.view.addSubview(addTeamView)
        
        teamEditDataView.frame = CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        teamEditDataView.isHidden = true
        teamEditDataView.delegate = self
        navigationController?.view.addSubview(teamEditDataView)
    }
    
    private func addAddTeamButton() {
        addTeamButton.title = "Add Team"
        addTeamButton.normalColor = UIColor.fcjWhite
        addTeamButton.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        addTeamButton.backgroundColor = UIColor.fcjDefaultBlue
        addTeamButton.layer.cornerRadius = 10
        addTeamButton.addAction {
            self.addTeamView.isHidden = false
        }

        view.addSubview(addTeamButton)
    }
    
    private func addTeamsTableView() {
        teamsTableView.delegate = self
        
        view.addSubview(teamsTableView)
    }
    
    private func setupConstraints() {
        
        addTeamButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        teamsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(addTeamButton.snp.bottom).offset(40)
            make.left.bottom.right.equalToSuperview()
        }
    }
}

extension TeamsDataViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        teamEditDataView.isHidden = false
        teamEditDataView.teamID = teamsTableView.teamsDataSource[indexPath.row].id
        teamEditDataView.teamName = teamsTableView.teamsDataSource[indexPath.row].name
        teamEditDataView.teamImage = teamsTableView.teamsDataSource[indexPath.row].imageName
    }
}

extension TeamsDataViewController: TeamDataDelegate {
    func dismiss(view: String) {
        switch view {
        case "AddTeamView":
            addTeamView.isHidden = true
        case "TeamEditDataView":
            teamEditDataView.isHidden = true
        default:
            break
        }
    }
    
    func refreshTeamsList() {
        teamsTableView.setupDataSource()
        addTeamView.isHidden = true
        teamEditDataView.isHidden = true
    }
}
