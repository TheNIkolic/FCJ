//
//  NextGameView.swift
//  FCJ
//

import UIKit

private struct Constants {
    
}

class NextGameView: UIView {
    
    private let titleLabelBackgroundView: UIView = UIView()
    private let titleLabel: FCJLabel = FCJLabel()
    private let dateTitleLabel: FCJLabel = FCJLabel()
    private let dateContentLabel: FCJLabel = FCJLabel()
    private let timeTitleLabel: FCJLabel = FCJLabel()
    private let timeContentLabel: FCJLabel = FCJLabel()
    private let firstLeagueImageView: UIImageView = UIImageView(image: UIImage(named: "prvaLigaLogo"))
    private let seasonTitleLabel: FCJLabel = FCJLabel()
    private let seasonContentLabel: FCJLabel = FCJLabel()
    private let roundTitleLabel: FCJLabel = FCJLabel()
    private let roundContentLabel: FCJLabel = FCJLabel()
    private let homeTeamImageView: UIImageView = UIImageView()
    private let homeTeamContainerView: UIView = UIView()
    private let homeTeamNameLabel: FCJLabel = FCJLabel.multiline()
    private let awayTeamContainerView: UIView = UIView()
    private let awayTeamImageView: UIImageView = UIImageView()
    private let awayTeamNameLabel: FCJLabel = FCJLabel()
    private let locationTitleLabel: FCJLabel = FCJLabel()
    private let locationContentLabel: FCJLabel = FCJLabel()
    
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
    
    var season: String = "" {
        didSet {
            seasonContentLabel.text = season
        }
    }
    
    var round: String = "" {
        didSet {
            roundContentLabel.text = round + "."
        }
    }
    
    var homeTeamImage: UIImage? {
        didSet {
            homeTeamImageView.image = homeTeamImage
        }
    }
    
    var homeTeamName: String = "" {
        didSet {
            homeTeamNameLabel.text = homeTeamName
        }
    }
    
    var awayTeamImage: UIImage? {
        didSet {
            awayTeamImageView.image = awayTeamImage
        }
    }
    
    var awayTeamName: String = "" {
        didSet {
            awayTeamNameLabel.text = awayTeamName
        }
    }
    
    var location: String = "" {
        didSet {
            locationContentLabel.text = location
        }
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        //self.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        
        addTitleLabelBackgroundView()
        addTitleLabel()
        addDateTitleLabel()
        addDateContentLabel()
        addTimeTitleLabel()
        addTimeContentLabel()
        addFirstLeagueImageView()
        addSeasonTitleLabel()
        addSeasonContentLabel()
        addRoundTitleLabel()
        addRoundContentLabel()
        addHomeTeamContainerView()
        addHomeTeamImageView()
        addHomeTeamNameLabel()
        addAwayTeamContainerView()
        addAwayTeamImageView()
        addAwayTeamNameLabel()
        addLocationTitleLabel()
        addLocationContentLabel()
        
        setupConstraints()
    }
    
    private func addTitleLabelBackgroundView() {
        titleLabelBackgroundView.layer.borderColor = UIColor.fcjDefaultBlue.cgColor
        titleLabelBackgroundView.layer.borderWidth = 4
        titleLabelBackgroundView.layer.cornerRadius = 16
        
        self.addSubview(titleLabelBackgroundView)
    }
    
    private func addTitleLabel() {
        titleLabel.text = "sledeća utakmica".uppercased()
        titleLabel.textColor = UIColor.fcjWhite
        titleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.normal)
        titleLabel.backgroundColor = UIColor.fcjDefaultBlue
        titleLabel.layer.cornerRadius = 10
        titleLabel.clipsToBounds = true
        titleLabel.textAlignment = .center
        
        titleLabelBackgroundView.addSubview(titleLabel)
    }
    
    private func addDateTitleLabel() {
        dateTitleLabel.text = "datum".uppercased()
        dateTitleLabel.textColor = UIColor.fcjDefaultGrey
        dateTitleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        dateTitleLabel.textAlignment = .center
        
        self.addSubview(dateTitleLabel)
    }
    
    private func addDateContentLabel() {
        dateContentLabel.textColor = UIColor.fcjDefaultBlue
        dateContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        dateContentLabel.textAlignment = .center
        
        self.addSubview(dateContentLabel)
    }
    
    private func addTimeTitleLabel() {
        timeTitleLabel.text = "vreme".uppercased()
        timeTitleLabel.textColor = UIColor.fcjDefaultGrey
        timeTitleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        timeTitleLabel.textAlignment = .center
        
        self.addSubview(timeTitleLabel)
    }
    
    private func addTimeContentLabel() {
        timeContentLabel.textColor = UIColor.fcjDefaultBlue
        timeContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        timeContentLabel.textAlignment = .center
        
        self.addSubview(timeContentLabel)
    }
    
    private func addFirstLeagueImageView() {
        self.addSubview(firstLeagueImageView)
    }
    
    private func addSeasonTitleLabel() {
        seasonTitleLabel.text = "sezona".uppercased()
        seasonTitleLabel.textColor = UIColor.fcjDefaultGrey
        seasonTitleLabel.font = UIFont.fcjLightFont(ofSize: FontSize.teeny)
        
        self.addSubview(seasonTitleLabel)
    }
    
    private func addSeasonContentLabel() {
        seasonContentLabel.text = "2020/2021"
        seasonContentLabel.textColor = UIColor.fcjBlack
        seasonContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        
        self.addSubview(seasonContentLabel)
    }
    
    private func addRoundTitleLabel() {
        roundTitleLabel.text = "kolo".uppercased()
        roundTitleLabel.textColor = UIColor.fcjDefaultGrey
        roundTitleLabel.font = UIFont.fcjLightFont(ofSize: FontSize.teeny)
        
        self.addSubview(roundTitleLabel)
    }
    
    private func addRoundContentLabel() {
        roundContentLabel.textColor = UIColor.fcjBlack
        roundContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        
        self.addSubview(roundContentLabel)
    }
    
    private func addHomeTeamContainerView() {
        self.addSubview(homeTeamContainerView)
    }
    
    private func addHomeTeamImageView() {
        homeTeamImageView.contentMode = .scaleAspectFit
        
        homeTeamContainerView.addSubview(homeTeamImageView)
    }
    
    private func addHomeTeamNameLabel() {
        homeTeamNameLabel.textColor = UIColor.fcjBlack
        homeTeamNameLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.standard)
        homeTeamNameLabel.textAlignment = .center
        
        homeTeamContainerView.addSubview(homeTeamNameLabel)
    }
    
    private func addAwayTeamContainerView() {
        self.addSubview(awayTeamContainerView)
    }
    
    private func addAwayTeamImageView() {
        awayTeamImageView.contentMode = .scaleAspectFit
        
        awayTeamContainerView.addSubview(awayTeamImageView)
    }
    
    private func addAwayTeamNameLabel() {
        awayTeamNameLabel.textColor = UIColor.fcjBlack
        awayTeamNameLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.standard)
        awayTeamNameLabel.textAlignment = .center
        
        awayTeamContainerView.addSubview(awayTeamNameLabel)
    }
    
    private func addLocationTitleLabel() {
        locationTitleLabel.text = "lokacija".uppercased()
        locationTitleLabel.textColor = UIColor.fcjDefaultGrey
        locationTitleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        locationTitleLabel.textAlignment = .center
        
        self.addSubview(locationTitleLabel)
    }
    
    private func addLocationContentLabel() {
        locationContentLabel.textColor = UIColor.fcjDefaultBlue
        locationContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.regular)
        locationContentLabel.textAlignment = .center
        
        self.addSubview(locationContentLabel)
    }
    
    private func setupConstraints() {
        titleLabelBackgroundView.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalToSuperview().multipliedBy(0.75)
        }
        
        dateTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabelBackgroundView.snp.bottom).offset(10)
            make.right.equalTo(titleLabelBackgroundView.snp.centerX).offset(44 * -1)
        }
        
        dateContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(4)
            make.centerX.equalTo(dateTitleLabel)
        }
        
        timeTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(dateTitleLabel)
            make.left.equalTo(titleLabelBackgroundView.snp.centerX).offset(44)
        }
        
        timeContentLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(dateContentLabel)
            make.centerX.equalTo(timeTitleLabel)
        }
        
        locationTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timeContentLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        locationContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(locationTitleLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        firstLeagueImageView.snp.makeConstraints { (make) in
            make.top.equalTo(locationContentLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(70)
        }
        
        seasonTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstLeagueImageView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        seasonContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(seasonTitleLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        roundTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(seasonContentLabel.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
        
        roundContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(roundTitleLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        homeTeamContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(locationContentLabel.snp.bottom).offset(30)
            make.left.equalToSuperview()
            make.right.equalTo(firstLeagueImageView.snp.left)
            make.height.equalTo(170)
        }
        
        homeTeamImageView.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 100 * 0.8, height: 140 * 0.8))
        }
        
        homeTeamNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(homeTeamImageView.snp.bottom).offset(10)
            make.centerX.equalTo(homeTeamImageView)
        }
        
        awayTeamContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(homeTeamContainerView)
            make.right.equalToSuperview()
            make.left.equalTo(firstLeagueImageView.snp.right)
            make.height.equalTo(170)
        }
        
        awayTeamImageView.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 100 * 0.8, height: 140 * 0.8))
        }
        
        awayTeamNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(awayTeamImageView.snp.bottom).offset(10)
            make.centerX.equalTo(awayTeamImageView)
        }
    }
}
