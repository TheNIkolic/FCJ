//
//  CompetitionsTableViewCell.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let competitionImageViewHeight: CGFloat = 70
}

class CompetitionsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "CompetitionsTableViewCell"
    
    private let competitionImageView: FCJImageView = FCJImageView()
    private let competitionNameLabel: FCJLabel = FCJLabel()
    private let separatorView: UIView = UIView()
    
    var competitionImageUrl: String = "" {
        didSet {
            competitionImageView.loadImageUsingUrlString(urlString: competitionImageUrl)
        }
    }
    
    var competitionName: String = "" {
        didSet {
            competitionNameLabel.text = competitionName
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.fcjClear
        selectionStyle = .none
        
        addCompetitionImageView()
        addTeamNameLabel()
        addSeparatorView()
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addCompetitionImageView() {
        competitionImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(competitionImageView)
    }
    
    private func addTeamNameLabel() {
        competitionNameLabel.textColor = UIColor.fcjDefaultBlue
        competitionNameLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        competitionNameLabel.textAlignment = .center
        
        contentView.addSubview(competitionNameLabel)
    }
    
    private func addSeparatorView() {
        
    }
    
    private func setupConstraints() {
        competitionImageView.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.width.height.equalTo(Constants.competitionImageViewHeight)
        }
        
        competitionNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(competitionImageView.snp.bottom).offset(Margins.small)
            make.centerX.equalToSuperview()
        }
    }
}

