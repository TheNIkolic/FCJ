//
//  TeamEditDataView.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let fieldPaddingViewFrame: CGRect =  CGRect(origin: .zero, size: CGSize(width: 20, height: 30))
}

class TeamEditDataView: UIView {
    
    private let containerView: UIView = UIView()
    private let addTeamLabel: FCJLabel = FCJLabel()
    private let teamNameLabel: FCJLabel = FCJLabel()
    private let teamNameField: UITextField = UITextField()
    private let teamHomeTownLabel: FCJLabel = FCJLabel()
    private let teamHomeTownField: UITextField = UITextField()
    private let teamImageLabel: FCJLabel = FCJLabel()
    private let teamImageField: UITextField = UITextField()
    private let updateButton: FCJButton = FCJButton()
    private let cancelButton: FCJButton = FCJButton()
    private let deleteTeamButton: FCJButton = FCJButton()
    
    var teamID: Int = 0 {
        didSet {
            //
        }
    }
    
    var teamName: String = "" {
        didSet {
            teamNameField.text = teamName
        }
    }
    
    var teamHomeTown: String = "" {
        didSet {
            teamHomeTownField.text = teamHomeTown
        }
    }
    
    var teamImage: String = "" {
        didSet {
            teamImageField.text = teamImage
        }
    }
    
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
        self.backgroundColor = UIColor.fcjBlack.withAlphaComponent(AlphaComponent.dark)
        
        addContainerView()
        addAddTeamLabel()
        addTeamNameLabel()
        addTeamNameField()
        addTeamHomeTownLabel()
        addTeamHomeTownField()
        addTeamImageLabel()
        addTeamImageField()
        addUpdateButton()
        addCancelButton()
        addDeleteTeamButton()
        
        setupConstraints()
        
        self.addTap {
            self.delegate?.dismiss(view: "TeamEditDataView")
        }
    }
    
    private func addContainerView() {
        containerView.backgroundColor = UIColor.fcjWhite
        containerView.layer.cornerRadius = Sizes.CornerRadius.normal
        containerView.applyShadowWith(color: UIColor.fcjBlack, offset: ShadowValues.Standard.offset, opacity: ShadowValues.Standard.opacity, radius: ShadowValues.Standard.radius)
        
        self.addSubview(containerView)
    }
    
    private func addAddTeamLabel() {
        addTeamLabel.text = "Edit Team Data"
        addTeamLabel.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
        
        containerView.addSubview(addTeamLabel)
    }
    
    private func addTeamNameLabel() {
        teamNameLabel.text = "Name"
        teamNameLabel.font = UIFont.boldSystemFont(ofSize: FontSize.small)
        
        containerView.addSubview(teamNameLabel)
    }
    
    private func addTeamNameField() {
        teamNameField.backgroundColor = UIColor.fcjDefaultGrey.withAlphaComponent(AlphaComponent.regular)
        teamNameField.layer.cornerRadius = Sizes.CornerRadius.small
        teamNameField.placeholder = "Enter Team Name"
        teamNameField.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        teamNameField.leftView = UIView(frame: Constants.fieldPaddingViewFrame)
        teamNameField.leftViewMode = .always
        
        containerView.addSubview(teamNameField)
    }
    
    private func addTeamHomeTownLabel() {
        teamHomeTownLabel.text = "Home Town"
        teamHomeTownLabel.font = UIFont.boldSystemFont(ofSize: FontSize.small)
        
        containerView.addSubview(teamHomeTownLabel)
    }
    
    private func addTeamHomeTownField() {
        teamHomeTownField.backgroundColor = UIColor.fcjDefaultGrey.withAlphaComponent(AlphaComponent.regular)
        teamHomeTownField.layer.cornerRadius = Sizes.CornerRadius.small
        teamHomeTownField.placeholder = "Enter Team Home Town"
        teamHomeTownField.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        teamHomeTownField.leftView = UIView(frame: Constants.fieldPaddingViewFrame)
        teamHomeTownField.leftViewMode = .always
        
        containerView.addSubview(teamHomeTownField)
    }
    
    private func addTeamImageLabel() {
        teamImageLabel.text = "Image"
        teamImageLabel.font = UIFont.boldSystemFont(ofSize: FontSize.small)
        
        containerView.addSubview(teamImageLabel)
    }
    
    private func addTeamImageField() {
        teamImageField.backgroundColor = UIColor.fcjDefaultGrey.withAlphaComponent(0.5)
        teamImageField.layer.cornerRadius = Sizes.CornerRadius.small
        teamImageField.placeholder = "Add Team Image"
        teamImageField.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        teamImageField.leftView = UIView(frame: Constants.fieldPaddingViewFrame)
        teamImageField.leftViewMode = .always
        
        containerView.addSubview(teamImageField)
    }
    
    private func addUpdateButton() {
        updateButton.title = "Update"
        updateButton.normalColor = UIColor.fcjWhite
        updateButton.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        updateButton.backgroundColor = UIColor.fcjDefaultBlue
        updateButton.layer.cornerRadius = Sizes.CornerRadius.regular
        updateButton.addAction {
            let request: Team = Team()
            if self.teamImageField.hasText && self.teamImageField.hasText {
                request.id = self.teamID
                request.name = self.teamNameField.text ?? ""
                request.imageUrl = self.teamImageField.text ?? ""
                request.homeTown = self.teamHomeTownField.text ?? ""
                dataProvider.editTeam(request: request) { (team) in
                    print(team)
                } failHandler: { (error) in
                    print(error.message)
                }
                
                self.delegate?.refreshTeamsList()
            }
            else {
                print("Some fields are empty")
            }
        }

        containerView.addSubview(updateButton)
    }
    
    private func addCancelButton() {
        cancelButton.title = "Cancel"
        cancelButton.normalColor = UIColor.fcjWhite
        cancelButton.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        cancelButton.backgroundColor = UIColor.fcjDefaultBlue
        cancelButton.layer.cornerRadius = Sizes.CornerRadius.regular
        cancelButton.addAction {
            self.delegate?.dismiss(view: "TeamEditDataView")
        }
        
        containerView.addSubview(cancelButton)
    }
    
    private func addDeleteTeamButton() {
        deleteTeamButton.title = "Delete Team"
        deleteTeamButton.normalColor = UIColor.fcjWhite
        deleteTeamButton.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        deleteTeamButton.backgroundColor = UIColor.fcjDefaultRed
        deleteTeamButton.layer.cornerRadius = Sizes.CornerRadius.regular
        deleteTeamButton.addAction {
            dataProvider.deleteTeam(teamID: self.teamID) { (message) in
                print(message, "deleted team \(self.teamName)")
            } failHandler: { (error) in
                print(error.message)
            }
            self.delegate?.refreshTeamsList()
        }
        
        containerView.addSubview(deleteTeamButton)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(SizeMultiplayers.medium)
        }
        
        addTeamLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Margins.normal)
            make.centerX.equalToSuperview()
        }
        
        teamNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addTeamLabel.snp.bottom).offset(Margins.tiny)
            make.left.equalToSuperview().offset(Margins.normal)
        }
        
        teamNameField.snp.makeConstraints { (make) in
            make.top.equalTo(teamNameLabel.snp.bottom).offset(Margins.tiny)
            make.left.equalTo(teamNameLabel)
            make.right.equalToSuperview().inset(Margins.normal)
            make.height.equalTo(Sizes.TextField.Height.medium)
        }
        
        teamHomeTownLabel.snp.makeConstraints { (make) in
            make.top.equalTo(teamNameField.snp.bottom).offset(Margins.normal)
            make.left.equalTo(teamNameLabel)
        }

        teamHomeTownField.snp.makeConstraints { (make) in
            make.top.equalTo(teamHomeTownLabel.snp.bottom).offset(Margins.tiny)
            make.left.equalTo(teamHomeTownLabel)
            make.right.equalToSuperview().inset(Margins.normal)
            make.height.equalTo(Sizes.TextField.Height.medium)
        }

        
        teamImageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(teamHomeTownField.snp.bottom).offset(Margins.normal)
            make.left.equalTo(teamNameLabel)
        }
        
        teamImageField.snp.makeConstraints { (make) in
            make.top.equalTo(teamImageLabel.snp.bottom).offset(Margins.tiny)
            make.left.equalTo(teamNameLabel)
            make.right.equalToSuperview().inset(Margins.normal)
            make.height.equalTo(Sizes.TextField.Height.medium)
        }
        
        updateButton.snp.makeConstraints { (make) in
            make.top.equalTo(teamImageField.snp.bottom).offset(Margins.normal)
            make.left.equalToSuperview().offset(Margins.normal)
            make.right.equalTo(self.snp.centerX).offset(Margins.regular * -1)
            make.height.equalTo(Sizes.Button.Height.standard)
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(updateButton)
            make.left.equalTo(self.snp.centerX).offset(Margins.regular)
            make.right.equalToSuperview().inset(Margins.normal)
            make.height.equalTo(Sizes.Button.Height.standard)
        }
        
        deleteTeamButton.snp.makeConstraints { (make) in
            make.top.equalTo(cancelButton.snp.bottom).offset(Margins.large)
            make.centerX.equalToSuperview()
            make.width.equalTo(cancelButton)
            make.height.equalTo(Sizes.Button.Height.standard)
            make.bottom.equalToSuperview().inset(Margins.normal)
        }
    }
}
