//
//  TeamsDataViewController.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let addTeamButtonSize = CGSize(width: 100, height: 40)
}

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
        
        teamEditDataView.delegate = self
        addTeamView.delegate = self
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Manage Teams Data"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white , NSAttributedString.Key.font: UIFont.fcjBoldFont(ofSize: FontSize.regular)!]
        navigationItem.rightBarButtonItem?.title = ""
    }
    
    private func addAddTeamButton() {
        addTeamButton.title = "Add Team"
        addTeamButton.normalColor = UIColor.fcjWhite
        addTeamButton.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        addTeamButton.backgroundColor = UIColor.fcjDefaultBlue
        addTeamButton.layer.cornerRadius = Sizes.CornerRadius.regular
        addTeamButton.addAction {
            self.showPopupView(view: self.addTeamView)
        }

        view.addSubview(addTeamButton)
    }
    
    private func addTeamsTableView() {
        teamsTableView.delegate = self
        
        view.addSubview(teamsTableView)
    }
    
    private func setupConstraints() {
        addTeamButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(Margins.normal)
            make.right.equalToSuperview().inset(Margins.normal)
            make.size.equalTo(Constants.addTeamButtonSize)
        }
        
        teamsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(addTeamButton.snp.bottom).offset(Margins.extraLarge)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    private func hidePopupView(view: UIView) {
        UIView.animate(withDuration: AnimationDuration.normal) {
            view.alpha = AlphaComponent.fullyTransparent
        } completion: { (_) in
            view.removeFromSuperview()
        }
    }
    
    private func showPopupView(view: UIView) {
        view.frame = CGRect(origin: .zero, size: UIScreen.main.bounds.size)
        view.alpha = AlphaComponent.fullyTransparent
        navigationController?.view.addSubview(view)
        
        UIView.animate(withDuration: AnimationDuration.normal) {
            view.alpha = AlphaComponent.fullyVisible
        }
    }
}

extension TeamsDataViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        teamEditDataView.teamID = teamsTableView.teamsDataSource[indexPath.row].id
        teamEditDataView.teamName = teamsTableView.teamsDataSource[indexPath.row].name
        teamEditDataView.teamImage = teamsTableView.teamsDataSource[indexPath.row].imageUrl
        teamEditDataView.teamHomeTown = teamsTableView.teamsDataSource[indexPath.row].homeTown
        
        self.showPopupView(view: teamEditDataView)
    }
}

extension TeamsDataViewController: TeamDataDelegate {
    func dismiss(view: String) {
        switch view {
        case "AddTeamView":
            hidePopupView(view: addTeamView)
        case "TeamEditDataView":
            hidePopupView(view: teamEditDataView)
        default:
            break
        }
    }
    
    func refreshTeamsList() {
        hidePopupView(view: addTeamView)
        hidePopupView(view: teamEditDataView)
        
        self.teamsTableView.setupDataSource()
    }
}
