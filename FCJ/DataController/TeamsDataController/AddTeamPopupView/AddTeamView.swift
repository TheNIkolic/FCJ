//
//  AddTeamView.swift
//  FCJ
//

import UIKit

class AddTeamView: UIView {
    
    private let containerView: UIView = UIView()
    private let addTeamLabel: FCJLabel = FCJLabel()
    private let teamNameLabel: FCJLabel = FCJLabel()
    private let teamNameField: UITextField = UITextField()
    private let teamImageLabel: FCJLabel = FCJLabel()
    private let teamImageField: UITextField = UITextField()
    private let addTeamButton: FCJButton = FCJButton()
    private let cancelButton: FCJButton = FCJButton()
    
    weak var delegate: TeamDataDelegate? = nil
    
    public init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = UIColor.fcjBlack.withAlphaComponent(0.7)
        
        addContainerView()
        addAddTeamLabel()
        addTeamNameLabel()
        addTeamNameField()
        addTeamImageLabel()
        addTeamImageField()
        addAddTeamButton()
        addCancelButton()
        
        setupConstraints()
        
        self.addTap {
            self.delegate?.dismiss(view: "AddTeamView")
        }
    }
    
    private func addContainerView() {
        containerView.backgroundColor = UIColor.fcjWhite
        containerView.layer.cornerRadius = 12
        containerView.applyShadowWith(color: UIColor.fcjBlack, offset: CGSize(width: 4, height: 8), opacity: 0.6, radius: 10)
        
        self.addSubview(containerView)
    }
    
    private func addAddTeamLabel() {
        addTeamLabel.text = "Add Team"
        addTeamLabel.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
        
        containerView.addSubview(addTeamLabel)
    }
    
    private func addTeamNameLabel() {
        teamNameLabel.text = "Name"
        teamNameLabel.font = UIFont.boldSystemFont(ofSize: FontSize.small)
        
        containerView.addSubview(teamNameLabel)
    }
    
    private func addTeamNameField() {
        teamNameField.backgroundColor = UIColor.fcjDefaultGrey.withAlphaComponent(0.5)
        teamNameField.layer.cornerRadius = 6
        teamNameField.placeholder = "Enter Team Name"
        teamNameField.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        teamNameField.leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 20, height: 30)))
        teamNameField.leftViewMode = .always
        
        containerView.addSubview(teamNameField)
    }
    
    private func addTeamImageLabel() {
        teamImageLabel.text = "Image"
        teamImageLabel.font = UIFont.boldSystemFont(ofSize: FontSize.small)
        
        containerView.addSubview(teamImageLabel)
    }
    
    private func addTeamImageField() {
        teamImageField.backgroundColor = UIColor.fcjDefaultGrey.withAlphaComponent(0.5)
        teamImageField.layer.cornerRadius = 6
        teamImageField.placeholder = "Add Team Image"
        teamImageField.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        teamImageField.leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 20, height: 30)))
        teamImageField.leftViewMode = .always
        
        containerView.addSubview(teamImageField)
    }
    
    private func addAddTeamButton() {
        addTeamButton.title = "Add Team"
        addTeamButton.normalColor = UIColor.fcjWhite
        addTeamButton.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        addTeamButton.backgroundColor = UIColor.fcjDefaultBlue
        addTeamButton.layer.cornerRadius = 10
        addTeamButton.addAction {
            let request: TeamRequest = TeamRequest()
            if self.teamImageField.hasText && self.teamImageField.hasText {
                request.name = self.teamNameField.text ?? ""
                request.imageName = self.teamImageField.text ?? ""
                dataProvider.createTeam(request: request) { (team) in
                    print(team.name)
                } failHandler: { (error) in
                    print(error.message)
                }
            }
            else {
                print("praznoooo")
            }
            
            self.delegate?.refreshTeamsList()
        }

        containerView.addSubview(addTeamButton)
    }
    
    private func addCancelButton() {
        cancelButton.title = "Cancel"
        cancelButton.normalColor = UIColor.fcjWhite
        cancelButton.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        cancelButton.backgroundColor = UIColor.fcjDefaultBlue
        cancelButton.layer.cornerRadius = 10
        cancelButton.addAction {
            self.delegate?.dismiss(view: "AddTeamView")
        }
        
        containerView.addSubview(cancelButton)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(self.snp.width).multipliedBy(0.85)
        }
        
        addTeamLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        teamNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addTeamLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(20)
        }
        
        teamNameField.snp.makeConstraints { (make) in
            make.top.equalTo(teamNameLabel.snp.bottom).offset(4)
            make.left.equalTo(teamNameLabel)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        teamImageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(teamNameField.snp.bottom).offset(20)
            make.left.equalTo(teamNameLabel)
        }
        
        teamImageField.snp.makeConstraints { (make) in
            make.top.equalTo(teamImageLabel.snp.bottom).offset(4)
            make.left.equalTo(teamNameLabel)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        addTeamButton.snp.makeConstraints { (make) in
            make.top.equalTo(teamImageField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(self.snp.centerX).offset(-10)
            make.height.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(addTeamButton)
            make.left.equalTo(self.snp.centerX).offset(10)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
    }
}
