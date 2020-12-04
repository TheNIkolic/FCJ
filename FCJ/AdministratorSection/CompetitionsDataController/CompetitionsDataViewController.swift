//
//  CompetitionsDataViewController.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let addTeamButtonSize = CGSize(width: 160, height: 40)
    static let rowHeight: CGFloat = 100
}

class CompetitionsDataViewController: BaseViewController {
    
    private let addCompetitionButton: FCJButton = FCJButton()
    private let nameField: FCJAdminTextField = FCJAdminTextField()
    private let stageNameField: FCJAdminTextField = FCJAdminTextField()
    private let imageUrlField: FCJAdminTextField = FCJAdminTextField()
    private let competitionTableView: UITableView = UITableView()
    
    var competitionDataSource: [Competition] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupDataSource()
        
        addAddCompetitionButton()
        addNameField()
        addStageNameField()
        addImageUrlField()
        addCompetitionTableView()
        
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Manage Competitions Data"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white , NSAttributedString.Key.font: UIFont.fcjBoldFont(ofSize: FontSize.regular)!]
        navigationItem.rightBarButtonItem?.title = ""
    }
    
    private func setupDataSource() {
        dataProvider.getAllCompetitions { (competitions) in
            self.competitionDataSource = competitions
            self.competitionTableView.reloadData()
        } failHandler: { (error) in
            print(error.message)
        }

    }
    
    private func addAddCompetitionButton() {
        addCompetitionButton.title = "Add Competition"
        addCompetitionButton.normalColor = UIColor.fcjWhite
        addCompetitionButton.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        addCompetitionButton.backgroundColor = UIColor.fcjDefaultBlue
        addCompetitionButton.layer.cornerRadius = Sizes.CornerRadius.regular
//        addCompetitionButton.addAction {
//            self.showPopupView(view: self.addTeamView)
//        }
        
        view.addSubview(addCompetitionButton)
    }
    
    private func addNameField() {
        nameField.fieldTitle = "Name"
        nameField.placeholder = "Enter Competition Name"
        
        view.addSubview(nameField)
    }
    
    private func addStageNameField() {
        stageNameField.fieldTitle = "Stage Name"
        stageNameField.placeholder = "Enter Stage Name"
        
        view.addSubview(stageNameField)
    }
    
    private func addImageUrlField() {
        imageUrlField.fieldTitle = "Image Url"
        imageUrlField.placeholder = "Enter Image URL"
        
        view.addSubview(imageUrlField)
    }
    
    private func addCompetitionTableView() {
        competitionTableView.dataSource = self
        competitionTableView.delegate = self
        competitionTableView.register(CompetitionsTableViewCell.self, forCellReuseIdentifier: CompetitionsTableViewCell.reuseIdentifier)
        competitionTableView.separatorStyle = .none
        competitionTableView.showsVerticalScrollIndicator = false
        competitionTableView.rowHeight = Constants.rowHeight
        competitionTableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        competitionTableView.backgroundColor = UIColor.fcjClear
        
        view.addSubview(competitionTableView)
    }
    
    private func setupConstraints() {
        addCompetitionButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(Margins.normal)
            make.left.equalToSuperview().inset(Margins.normal)
            make.size.equalTo(Constants.addTeamButtonSize)
        }
        
        nameField.snp.makeConstraints { (make) in
            make.top.equalTo(addCompetitionButton.snp.bottom).offset(Margins.large)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.medium)
            make.height.equalTo(Sizes.TextField.Height.medium)
        }
        
        stageNameField.snp.makeConstraints { (make) in
            make.top.equalTo(nameField.snp.bottom).offset(Margins.large)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.medium)
            make.height.equalTo(Sizes.TextField.Height.medium)
        }
        
        imageUrlField.snp.makeConstraints { (make) in
            make.top.equalTo(stageNameField.snp.bottom).offset(Margins.large)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.medium)
            make.height.equalTo(Sizes.TextField.Height.medium)
        }
        
        competitionTableView.snp.makeConstraints { (make) in
            make.top.equalTo(imageUrlField.snp.bottom).offset(Margins.big)
            make.left.bottom.right.equalToSuperview()
        }
    }
}

extension CompetitionsDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitionDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompetitionsTableViewCell.reuseIdentifier, for: indexPath)
        
        guard let competitionCell = cell as? CompetitionsTableViewCell else {
            return cell
        }
        
        let competitionData = competitionDataSource[indexPath.row]
        
        competitionCell.competitionImageUrl = competitionData.imageUrl
        competitionCell.competitionName = competitionData.name
        
        return competitionCell
    }
}

extension CompetitionsDataViewController: UITableViewDelegate {}
