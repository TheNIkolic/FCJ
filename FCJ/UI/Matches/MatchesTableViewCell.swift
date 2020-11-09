//
//  MatchesTableViewCell.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let firstLeagueImageViewSize = CGSize(width: 55, height: 55)
    static let teamImageViewSize = CGSize(width: 60, height: 60)
}

class MatchesTableViewCell: UITableViewCell {
    
    private let containerView: UIView = UIView()
    private let homeTeamImageView: FCJImageView = FCJImageView()
    private let homeTeamNameLabel: FCJLabel = FCJLabel()
    private let homeTeamHomeTownLabel: FCJLabel = FCJLabel()
    private let awayTeamImageView: FCJImageView = FCJImageView()
    private let awayTeamNameLabel: FCJLabel = FCJLabel()
    private let awayTeamHomeTownLabel: FCJLabel = FCJLabel()
    private let dateTitleLabel: FCJLabel = FCJLabel()
    private let dateContentLabel: FCJLabel = FCJLabel()
    private let timeContentLabel: FCJLabel = FCJLabel()
    private let timeTitleLabel: FCJLabel = FCJLabel()
    
    var homeTeamImage: String = "" {
        didSet {
            homeTeamImageView.loadImageUsingUrlString(urlString: homeTeamImage)
        }
    }
    
    var homeTeamName: String = "" {
        didSet {
            homeTeamNameLabel.text = homeTeamName
        }
    }
    
    var homeTeamHomeTown: String = "" {
        didSet {
            homeTeamHomeTownLabel.text = homeTeamHomeTown
        }
    }
    
    var awayTeamImage: String = "" {
        didSet {
            awayTeamImageView.loadImageUsingUrlString(urlString: awayTeamImage)
        }
    }
    
    var awayTeamName: String = "" {
        didSet {
            awayTeamNameLabel.text = awayTeamName
        }
    }
    
    var awayTeamHomeTown: String = "" {
        didSet {
            awayTeamHomeTownLabel.text = awayTeamHomeTown
        }
    }
    
    var kickOffDate: String = "" {
        didSet {
            dateContentLabel.text = kickOffDate
        }
    }

    var kickOffTime: String = "" {
        didSet {
            timeContentLabel.text = kickOffTime
        }
    }

    
    static let reuseIdentifier: String = "MatchesTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = UIColor.fcjClear
        selectionStyle = .none
        
        addContainerView()
        addHomeTeamImageView()
        addHomeTeamNameLabel()
        addHomeTeamHomeTownLabel()
        addAwayTeamImageView()
        addAwayTeamNameLabel()
        addAwayTeamHomeTownLabel()
        addDateTitleLabel()
        addDateContentLabel()
        addTimeContentLabel()
        addTimeTitleLabel()
        
        setupConstraints()
    }
    
    private func addContainerView() {
        containerView.backgroundColor = UIColor.fcjWhite
        containerView.applyShadowWith(color: UIColor.fcjBlack, offset: ShadowValues.Regular.offset, opacity: ShadowValues.Regular.opacity, radius: ShadowValues.Regular.radius)
        containerView.layer.cornerRadius = Sizes.CornerRadius.big
        
        contentView.addSubview(containerView)
    }
    
    private func addHomeTeamImageView() {
        homeTeamImageView.contentMode = .scaleAspectFit
        
        containerView.addSubview(homeTeamImageView)
    }
    
    private func addHomeTeamNameLabel() {
        homeTeamNameLabel.textColor = UIColor.fcjDefaultBlue
        homeTeamNameLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        homeTeamNameLabel.textAlignment = .center
        
        containerView.addSubview(homeTeamNameLabel)
    }
    
    private func addHomeTeamHomeTownLabel() {
        homeTeamHomeTownLabel.textColor = UIColor.fcjBlack
        homeTeamHomeTownLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        homeTeamHomeTownLabel.textAlignment = .center
        
        containerView.addSubview(homeTeamHomeTownLabel)
    }
    
    private func addAwayTeamImageView() {
        awayTeamImageView.contentMode = .scaleAspectFit
        
        containerView.addSubview(awayTeamImageView)
    }
    
    private func addAwayTeamNameLabel() {
        awayTeamNameLabel.textColor = UIColor.fcjDefaultBlue
        awayTeamNameLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        awayTeamNameLabel.textAlignment = .center
        
        containerView.addSubview(awayTeamNameLabel)
    }
    
    private func addAwayTeamHomeTownLabel() {
        awayTeamHomeTownLabel.textColor = UIColor.fcjBlack
        awayTeamHomeTownLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        awayTeamHomeTownLabel.textAlignment = .center
        
        containerView.addSubview(awayTeamHomeTownLabel)
    }
    
    private func addDateTitleLabel() {
        dateTitleLabel.text = "datum".uppercased()
        dateTitleLabel.textColor = UIColor.fcjDefaultGrey
        dateTitleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.tiny)
        dateTitleLabel.textAlignment = .center

        self.addSubview(dateTitleLabel)
    }
    
    private func addDateContentLabel() {
        dateContentLabel.textColor = UIColor.fcjBlack
        dateContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.teeny)
        dateContentLabel.textAlignment = .center

        self.addSubview(dateContentLabel)
    }
    
    private func addTimeContentLabel() {
        timeContentLabel.textColor = UIColor.fcjBlack
        timeContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.teeny)
        timeContentLabel.textAlignment = .center

        self.addSubview(timeContentLabel)
    }
    
    private func addTimeTitleLabel() {
        timeTitleLabel.text = "vreme".uppercased()
        timeTitleLabel.textColor = UIColor.fcjDefaultGrey
        timeTitleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.tiny)
        timeTitleLabel.textAlignment = .center

        self.addSubview(timeTitleLabel)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(Margins.medium)
            make.right.bottom.equalToSuperview().inset(Margins.medium)
        }
        
        homeTeamImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Margins.regular)
            make.right.equalTo(self.snp.centerX).offset((Margins.extraLarge + 20) * -1)
            make.size.equalTo(Constants.teamImageViewSize)
        }
        
        homeTeamNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(homeTeamImageView.snp.bottom).offset(Margins.small)
            make.centerX.equalTo(homeTeamImageView)
            make.width.equalToSuperview()
        }
        
        homeTeamHomeTownLabel.snp.makeConstraints { (make) in
            make.top.equalTo(homeTeamNameLabel.snp.bottom).offset(Margins.tiny)
            make.centerX.equalTo(homeTeamNameLabel)
        }
        
        awayTeamImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(homeTeamImageView)
            make.left.equalTo(self.snp.centerX).offset(Margins.extraLarge + 20)
            make.size.equalTo(Constants.teamImageViewSize)
        }
        
        awayTeamNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(awayTeamImageView.snp.bottom).offset(Margins.small)
            make.centerX.equalTo(awayTeamImageView)
            make.width.equalToSuperview()
        }
        
        awayTeamHomeTownLabel.snp.makeConstraints { (make) in
            make.top.equalTo(awayTeamNameLabel.snp.bottom).offset(Margins.tiny)
            make.centerX.equalTo(awayTeamNameLabel)
            make.bottom.equalToSuperview().inset(Margins.regular)
        }
        
        dateTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(homeTeamImageView.snp.centerY).offset(Margins.tiny * -1)
            make.centerX.equalToSuperview()
        }
        
        dateContentLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(dateTitleLabel.snp.top)
            make.centerX.equalToSuperview()
        }
        
        timeContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(homeTeamImageView.snp.centerY).offset(Margins.tiny)
            make.centerX.equalToSuperview()
        }

        timeTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timeContentLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}

