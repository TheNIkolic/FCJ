//
//  BaseDataController.swift
//  FCJ
//

import UIKit

class BaseDataController: BaseViewController {
    
    private let manageTeamsButton: FCJButton = FCJButton()
    
    private let teamsVC: TeamsDataViewController = TeamsDataViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addManageTeamsButton()
        
        setupConstraints()
        setupNavigationBar()
    }
    
    private func addManageTeamsButton() {
        dataControllerTheme(button: manageTeamsButton, title: "teams", presentVC: teamsVC)
        
        view.addSubview(manageTeamsButton)
    }
    
    private func setupConstraints() {
        manageTeamsButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
    }
    
    private func dataControllerTheme(button: FCJButton, title: String, presentVC: UIViewController) {
        button.backgroundColor = UIColor.fcjDefaultBlue
        button.normalColor = UIColor.fcjWhite
        button.layer.cornerRadius = 16
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
