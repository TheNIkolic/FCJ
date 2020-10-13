//
//  TeamsTableViewCell.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let separatorLabelOffset = UIEdgeInsets(top: -4, left: 0, bottom: 4, right: 0)
    static let separatorLabelHeight: CGFloat = 10
}

class TeamsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "TeamsTableViewCell"
    
    private let cellBackgroundView: UIView = UIView()
    private let teamImageView: UIImageView = UIImageView()
    private let teamNameLabel: FCJLabel = FCJLabel.multiline()
    
    var teamImage: UIImage? {
        didSet {
            teamImageView.image = teamImage
        }
    }
    
    var teamName: String = "" {
        didSet {
            teamNameLabel.text = teamName
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.fcjClear
        selectionStyle = .none
        
        addCellBackgroundView()
        addTeamImageView()
        addTeamNameLabel()
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addCellBackgroundView() {
        cellBackgroundView.backgroundColor = UIColor.fcjDefaultGrey.withAlphaComponent(0.3)
        cellBackgroundView.layer.cornerRadius = 12
        
        contentView.addSubview(cellBackgroundView)
    }
    
    private func addTeamImageView() {
        teamImageView.contentMode = .scaleAspectFit
        
        cellBackgroundView.addSubview(teamImageView)
    }
    
    private func addTeamNameLabel() {
        teamNameLabel.textColor = UIColor.fcjBlack
        teamNameLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.normal)
        teamNameLabel.textAlignment = .center
        
        cellBackgroundView.addSubview(teamNameLabel)
    }
    
    private func setupConstraints() {
        cellBackgroundView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.86)
            make.height.equalToSuperview().multipliedBy(0.86)
        }
        
        teamImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(cellBackgroundView.snp.height).multipliedBy(0.8)
        }
        
        teamNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(teamImageView)
            make.left.equalTo(teamImageView.snp.right).offset(20)
            make.right.equalToSuperview().inset(20)
        }
    }
}

