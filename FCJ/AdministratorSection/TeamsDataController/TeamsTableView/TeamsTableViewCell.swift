//
//  TeamsTableViewCell.swift
//  FCJ
//

import UIKit

private struct Constants {
    
}

class TeamsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "TeamsTableViewCell"
    
    private let cellBackgroundView: FCJGradientView = FCJGradientView()
    private let teamImageView: FCJImageView = FCJImageView()
    private let teamNameLabel: FCJLabel = FCJLabel()
    private let teamHomeTownLabel: FCJLabel = FCJLabel()
    
    var teamImageUrl: String = "" {
        didSet {
            teamImageView.loadImageUsingUrlString(urlString: teamImageUrl)
        }
    }
    
    var teamName: String = "" {
        didSet {
            teamNameLabel.text = teamName
        }
    }
    
    var teamHomeTown: String = "" {
        didSet {
            teamHomeTownLabel.text = teamHomeTown
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.fcjClear
        selectionStyle = .none
        
        addCellBackgroundView()
        addTeamImageView()
        addTeamNameLabel()
        addTeamHomeTownLabel()
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addCellBackgroundView() {
        cellBackgroundView.gradientSettings.colors = [UIColor.fcjDefaultGrey.withAlphaComponent(AlphaComponent.light), UIColor.fcjDefaultGrey.withAlphaComponent(AlphaComponent.regular)]
        cellBackgroundView.gradientSettings.orientation = .vertical
        cellBackgroundView.layer.cornerRadius = Sizes.CornerRadius.normal
        cellBackgroundView.applyShadowWith(color: UIColor.fcjBlack, offset: ShadowValues.Regular.offset, opacity: ShadowValues.Regular.opacity, radius: ShadowValues.Regular.radius)
        
        contentView.addSubview(cellBackgroundView)
    }
    
    private func addTeamImageView() {
        teamImageView.contentMode = .scaleAspectFit
        
        cellBackgroundView.addSubview(teamImageView)
    }
    
    private func addTeamNameLabel() {
        teamNameLabel.textColor = UIColor.fcjDefaultBlue
        teamNameLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        teamNameLabel.textAlignment = .center
        
        cellBackgroundView.addSubview(teamNameLabel)
    }
    
    private func addTeamHomeTownLabel() {
        teamHomeTownLabel.textColor = UIColor.fcjBlack
        teamHomeTownLabel.font = UIFont.fcjLightFont(ofSize: FontSize.regular)
        teamHomeTownLabel.textAlignment = .center
        
        cellBackgroundView.addSubview(teamHomeTownLabel)
    }
    
    private func setupConstraints() {
        cellBackgroundView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.medium)
            make.height.equalToSuperview().multipliedBy(SizeMultiplayers.medium)
        }
        
        teamImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(Margins.normal)
            make.width.height.equalTo(cellBackgroundView.snp.height).multipliedBy(SizeMultiplayers.regular)
        }
        
        teamNameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.centerY).offset(Margins.tiny * -1)
            make.centerX.equalToSuperview().offset(Margins.normal)
        }
        
        teamHomeTownLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY).offset(Margins.tiny)
            make.centerX.equalTo(teamNameLabel)
        }
    }
}

