//
//  PreviousMatchTableViewCell.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let firstLeagueImageViewSize = CGSize(width: 55, height: 55)
    static let teamImageViewSize = CGSize(width: 60, height: 60)
    static let infoButtonSize = CGSize(width: 60, height: 24)
}

enum MatchResult {
    case homeWin
    case awayWin
    case draw
}

class PreviousMatchTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "PreviousMatchTableViewCell"
    
    private let containerView: UIView = UIView()
    private let homeTeamImageView: FCJImageView = FCJImageView()
    private let homeTeamScoreLabel: FCJLabel = FCJLabel()
    private let homeTeamNameLabel: FCJLabel = FCJLabel()
    private let homeTeamHomeTownLabel: FCJLabel = FCJLabel()
    private let awayTeamImageView: FCJImageView = FCJImageView()
    private let awayTeamScoreLabel: FCJLabel = FCJLabel()
    private let awayTeamNameLabel: FCJLabel = FCJLabel()
    private let awayTeamHomeTownLabel: FCJLabel = FCJLabel()
    private let vsView: UIView = UIView()
    private let competitionImageView: FCJImageView = FCJImageView()
    private let infoButton: FCJButton = FCJButton()
    private let infoContainerView: UIView = UIView()
    private let closeInfoButton: FCJButton = FCJButton()
    private let dateTitleLabel: FCJLabel = FCJLabel()
    private let dateContentLabel: FCJLabel = FCJLabel()
    private let timeContentLabel: FCJLabel = FCJLabel()
    private let timeTitleLabel: FCJLabel = FCJLabel()
    
    var matchResult: Int = 0 {
        didSet {
            switch matchResult {
            case 0:
                homeTeamImageView.alpha = AlphaComponent.regular
                homeTeamNameLabel.alpha = AlphaComponent.regular
                homeTeamHomeTownLabel.alpha = AlphaComponent.regular
                
                awayTeamImageView.alpha = AlphaComponent.regular
                awayTeamNameLabel.alpha = AlphaComponent.regular
                awayTeamHomeTownLabel.alpha = AlphaComponent.regular
            case 1:
                homeTeamImageView.alpha = AlphaComponent.fullyVisible
                homeTeamNameLabel.alpha = AlphaComponent.fullyVisible
                homeTeamHomeTownLabel.alpha = AlphaComponent.fullyVisible
                
                awayTeamImageView.alpha = AlphaComponent.regular
                awayTeamNameLabel.alpha = AlphaComponent.regular
                awayTeamHomeTownLabel.alpha = AlphaComponent.regular
            case 2:
                homeTeamImageView.alpha = AlphaComponent.regular
                homeTeamNameLabel.alpha = AlphaComponent.regular
                homeTeamHomeTownLabel.alpha = AlphaComponent.regular
                
                awayTeamImageView.alpha = AlphaComponent.fullyVisible
                awayTeamNameLabel.alpha = AlphaComponent.fullyVisible
                awayTeamHomeTownLabel.alpha = AlphaComponent.fullyVisible
            default:
                break
            }
        }
    }
    
    var homeTeamImage: String = "" {
        didSet {
            homeTeamImageView.loadImageUsingUrlString(urlString: homeTeamImage)
        }
    }
    
    var homeTeamScore: Int = 0 {
        didSet {
            homeTeamScoreLabel.text = "\(homeTeamScore)"
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
    
    var awayTeamScore: Int = 0 {
        didSet {
            awayTeamScoreLabel.text = "\(awayTeamScore)"
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
    
    var competitionImage: String = "" {
        didSet {
            competitionImageView.loadImageUsingUrlString(urlString: competitionImage)
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.infoContainerView.isHidden = true
    }
    
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
        addHomeTeamScoreLabel()
        addHomeTeamNameLabel()
        addHomeTeamHomeTownLabel()
        addAwayTeamImageView()
        addAwayTeamScoreLabel()
        addAwayTeamNameLabel()
        addAwayTeamHomeTownLabel()
        addVsView()
        addCopetitionImageView()
        addInfoButton()
        addInfoContainerView()
        addCloseInfoButton()
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
    
    private func addHomeTeamScoreLabel() {
        homeTeamScoreLabel.textColor = UIColor.fcjBlack
        homeTeamScoreLabel.font = UIFont.fcjBoldFont(ofSize: 30)
        homeTeamScoreLabel.textAlignment = .center
        
        containerView.addSubview(homeTeamScoreLabel)
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
    
    private func addAwayTeamScoreLabel() {
        awayTeamScoreLabel.textColor = UIColor.fcjBlack
        awayTeamScoreLabel.font = UIFont.fcjBoldFont(ofSize: 30)
        awayTeamScoreLabel.textAlignment = .center
        
        containerView.addSubview(awayTeamScoreLabel)
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
    
    private func addVsView() {
        vsView.backgroundColor = UIColor.fcjBlack
        
        containerView.addSubview(vsView)
    }
    
    private func addCopetitionImageView() {
        containerView.addSubview(competitionImageView)
    }
    
    private func addInfoButton() {
        infoButton.title = "info".uppercased()
        infoButton.normalColor = UIColor.fcjWhite
        infoButton.titleFont = UIFont.fcjBoldFont(ofSize: FontSize.small)
        infoButton.backgroundColor = UIColor.fcjDefaultBlue
        infoButton.layer.cornerRadius = Sizes.CornerRadius.small
        infoButton.addAction {
            self.infoContainerView.isHidden = false
        }
        
        containerView.addSubview(infoButton)
    }
    
    private func addInfoContainerView() {
        infoContainerView.isHidden = true
        infoContainerView.backgroundColor = UIColor.fcjDefaultBlue
        
        containerView.addSubview(infoContainerView)
    }
    
    private func addCloseInfoButton() {
        closeInfoButton.title = "x"
        closeInfoButton.normalColor = UIColor.fcjBlack
        closeInfoButton.addAction {
            self.infoContainerView.isHidden = true
        }
        
        infoContainerView.addSubview(closeInfoButton)
    }
    
    private func addDateTitleLabel() {
        dateTitleLabel.text = "datum".uppercased()
        dateTitleLabel.textColor = UIColor.fcjDefaultGrey
        dateTitleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.tiny)
        dateTitleLabel.textAlignment = .center

        infoContainerView.addSubview(dateTitleLabel)
    }

    private func addDateContentLabel() {
        dateContentLabel.textColor = UIColor.fcjBlack
        dateContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.teeny)
        dateContentLabel.textAlignment = .center

        infoContainerView.addSubview(dateContentLabel)
    }

    private func addTimeContentLabel() {
        timeContentLabel.textColor = UIColor.fcjBlack
        timeContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.teeny)
        timeContentLabel.textAlignment = .center

        infoContainerView.addSubview(timeContentLabel)
    }

    private func addTimeTitleLabel() {
        timeTitleLabel.text = "vreme".uppercased()
        timeTitleLabel.textColor = UIColor.fcjDefaultGrey
        timeTitleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.tiny)
        timeTitleLabel.textAlignment = .center

        infoContainerView.addSubview(timeTitleLabel)
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
        
        homeTeamScoreLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(homeTeamImageView)
            make.left.equalTo(homeTeamImageView.snp.right).offset(Margins.large)
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
        
        awayTeamScoreLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(awayTeamImageView)
            make.right.equalTo(awayTeamImageView.snp.left).inset(Margins.large * -1)
        }
        
        awayTeamNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(awayTeamImageView.snp.bottom).offset(Margins.small)
            make.centerX.equalTo(awayTeamImageView)
            make.width.equalToSuperview()
        }
        
        awayTeamHomeTownLabel.snp.makeConstraints { (make) in
            make.top.equalTo(awayTeamNameLabel.snp.bottom).offset(Margins.tiny)
            make.centerX.equalTo(awayTeamNameLabel)
        }
        
        vsView.snp.makeConstraints { (make) in
            make.centerY.equalTo(homeTeamImageView)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 10, height: 3))
        }
        
        competitionImageView.snp.makeConstraints { (make) in
            make.top.equalTo(homeTeamNameLabel)
            make.centerX.equalToSuperview()
            make.size.equalTo(Constants.firstLeagueImageViewSize)
        }
        
        infoButton.snp.makeConstraints { (make) in
            make.top.equalTo(competitionImageView.snp.bottom).offset(Margins.small)
            make.centerX.equalTo(competitionImageView)
            make.size.equalTo(Constants.infoButtonSize)
        }
        
        infoContainerView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalToSuperview().multipliedBy(SizeMultiplayers.regular)
        }
        
        closeInfoButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Margins.regular)
            make.right.equalToSuperview().inset(Margins.regular)
            make.width.height.equalTo(Sizes.Button.Height.small)
        }
        
        
        dateContentLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Margins.tiny)
            make.centerX.equalToSuperview()
        }
        
        dateTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateContentLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        timeContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(Margins.tiny)
            make.centerX.equalToSuperview()
        }

        timeTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timeContentLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}


