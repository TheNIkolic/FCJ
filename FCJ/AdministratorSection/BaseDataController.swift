//
//  BaseDataController.swift
//  FCJ
//

import UIKit

class BaseDataController: BaseViewController {
    
    private let manageTeamsButton: FCJButton = FCJButton()
    private let manageMatchesButton: FCJButton = FCJButton()
    private let manageCompetitionsButton: FCJButton = FCJButton()
    
    private let teamsVC: TeamsDataViewController = TeamsDataViewController()
    private let matchesVC: MatchesDataViewController = MatchesDataViewController()
    private let competitionsVC: CompetitionsDataViewController = CompetitionsDataViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addManageTeamsButton()
        addManageMatchesButton()
        addManageCompetitionsButton()
        
        setupConstraints()
        setupNavigationBar()
    }
    
    private func addManageTeamsButton() {
        dataControllerTheme(button: manageTeamsButton, title: "teams", presentVC: teamsVC)
        
        view.addSubview(manageTeamsButton)
    }
    
    private func addManageMatchesButton() {
        dataControllerTheme(button: manageMatchesButton, title: "matches", presentVC: matchesVC)
        
        view.addSubview(manageMatchesButton)
    }
    
    private func addManageCompetitionsButton() {
        dataControllerTheme(button: manageCompetitionsButton, title: "competitions", presentVC: competitionsVC)
        
        view.addSubview(manageCompetitionsButton)
    }
    
    private func setupConstraints() {
        manageTeamsButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(Margins.large)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.standard)
            make.height.equalTo(Sizes.Button.Height.big)
        }
        
        manageMatchesButton.snp.makeConstraints { (make) in
            make.top.equalTo(manageTeamsButton.snp.bottom).offset(Margins.normal)
            make.centerX.equalToSuperview()
            make.size.equalTo(manageTeamsButton)
        }
        
        manageCompetitionsButton.snp.makeConstraints { (make) in
            make.top.equalTo(manageMatchesButton.snp.bottom).offset(Margins.normal)
            make.centerX.equalToSuperview()
            make.size.equalTo(manageTeamsButton)
        }
    }
    
    private func dataControllerTheme(button: FCJButton, title: String, presentVC: UIViewController) {
        button.backgroundColor = UIColor.fcjDefaultBlue
        button.normalColor = UIColor.fcjWhite
        button.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.normal)
        button.layer.cornerRadius = Sizes.CornerRadius.large
        button.title = title.uppercased()
        button.addAction {
            self.navigationController?.pushViewController(presentVC, animated: true)
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.fcjDefaultBlue
        navigationController?.navigationBar.tintColor = UIColor.fcjBlack
        navigationItem.title = "Data Controllers"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white , NSAttributedString.Key.font: UIFont.fcjBoldFont(ofSize: FontSize.regular)!]
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "BackToApp", style: .plain, target: self, action: #selector(dismissSelf))
    }
    
    @objc private func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
}
