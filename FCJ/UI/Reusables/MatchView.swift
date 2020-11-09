//
//  MatchView.swift
//  FCJ
//

import UIKit

public enum MatchStatus {
    case nextMatch
    case upcoming
    case prvious
}

private struct Constants {
    static let firstLeagueImageViewSize = CGSize(width: 55, height: 55)
    static let teamImageViewSizeBig = CGSize(width: 80, height: 80)
    static let teamImageViewSizeSmall = CGSize(width: 60, height: 60)
}

class MatchView: UIView {
    
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
    private let firstLeagueImageView: UIImageView = UIImageView(image: UIImage(named: "prvaLigaLogo"))
    private let roundTitleLabel: FCJLabel = FCJLabel()
    private let roundContentLabel: FCJLabel = FCJLabel()
    private let seasonTitleLabel: FCJLabel = FCJLabel()
    private let seasonContentLabel: FCJLabel = FCJLabel()
    private let locationContentLabel: FCJLabel = FCJLabel()
    private let locationTitleLabel: FCJLabel = FCJLabel()
    
    var status: MatchStatus = .nextMatch {
        didSet {
            switch status {
            case .nextMatch:
                nextMatchLayout()
            case .upcoming:
                print("")
            case .prvious:
                print("")
            }
        }
    }
    
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

    var round: String = "" {
        didSet {
            roundContentLabel.text = round + "."
        }
    }
    
    var season: String = "" {
        didSet {
            seasonContentLabel.text = season
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
        addFirstLeagueImageView()
        addRoundTitleLabel()
        addRoundContentLabel()
        addSeasonTitleLabel()
        addSeasonContentLabel()
        addLocationContentLabel()
        addLocationTitleLabel()
        
        setupConstraints()
    }
    
    private func addHomeTeamImageView() {
        homeTeamImageView.contentMode = .scaleAspectFit
        
        self.addSubview(homeTeamImageView)
    }
    
    private func addHomeTeamNameLabel() {
        homeTeamNameLabel.textColor = UIColor.fcjDefaultBlue
        homeTeamNameLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.standard)
        homeTeamNameLabel.textAlignment = .center
        
        self.addSubview(homeTeamNameLabel)
    }
    
    private func addHomeTeamHomeTownLabel() {
        homeTeamHomeTownLabel.textColor = UIColor.fcjBlack
        homeTeamHomeTownLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.standard)
        homeTeamHomeTownLabel.textAlignment = .center
        
        self.addSubview(homeTeamHomeTownLabel)
    }
    
    private func addAwayTeamImageView() {
        awayTeamImageView.contentMode = .scaleAspectFit
        
        self.addSubview(awayTeamImageView)
    }
    
    private func addAwayTeamNameLabel() {
        awayTeamNameLabel.textColor = UIColor.fcjDefaultBlue
        awayTeamNameLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.standard)
        awayTeamNameLabel.textAlignment = .center
        
        self.addSubview(awayTeamNameLabel)
    }
    
    private func addAwayTeamHomeTownLabel() {
        awayTeamHomeTownLabel.textColor = UIColor.fcjBlack
        awayTeamHomeTownLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.standard)
        awayTeamHomeTownLabel.textAlignment = .center
        
        self.addSubview(awayTeamHomeTownLabel)
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
        dateContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        dateContentLabel.textAlignment = .center

        self.addSubview(dateContentLabel)
    }
    
    private func addTimeContentLabel() {
        timeContentLabel.textColor = UIColor.fcjBlack
        timeContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
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
    
    private func addFirstLeagueImageView() {
        self.addSubview(firstLeagueImageView)
    }

    private func addRoundTitleLabel() {
        roundTitleLabel.text = "kolo".uppercased()
        roundTitleLabel.textColor = UIColor.fcjDefaultGrey
        roundTitleLabel.font = UIFont.fcjLightFont(ofSize: FontSize.tiny)

        self.addSubview(roundTitleLabel)
    }

    private func addRoundContentLabel() {
        roundContentLabel.textColor = UIColor.fcjBlack
        roundContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.tiny)

        self.addSubview(roundContentLabel)
    }
    
    
    private func addSeasonTitleLabel() {
        seasonTitleLabel.text = "sezona".uppercased()
        seasonTitleLabel.textColor = UIColor.fcjDefaultGrey
        seasonTitleLabel.font = UIFont.fcjLightFont(ofSize: FontSize.tiny)

        self.addSubview(seasonTitleLabel)
    }

    private func addSeasonContentLabel() {
        seasonContentLabel.textColor = UIColor.fcjBlack
        seasonContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.tiny)

        self.addSubview(seasonContentLabel)
    }
    
    private func addLocationContentLabel() {
        locationContentLabel.textColor = UIColor.fcjBlack
        locationContentLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        locationContentLabel.textAlignment = .center

        self.addSubview(locationContentLabel)
    }
    
    private func addLocationTitleLabel() {
        locationTitleLabel.text = "lokacija".uppercased()
        locationTitleLabel.textColor = UIColor.fcjDefaultGrey
        locationTitleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.tiny)
        locationTitleLabel.textAlignment = .center

        self.addSubview(locationTitleLabel)
    }
    
    private func setupConstraints() {
        homeTeamImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalTo(self.snp.centerX).offset((Margins.extraLarge + 20) * -1)
            make.size.equalTo(Constants.teamImageViewSizeBig)
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
            make.size.equalTo(Constants.teamImageViewSizeBig)
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
        
        firstLeagueImageView.snp.makeConstraints { (make) in
            make.top.equalTo(homeTeamNameLabel)
            make.centerX.equalToSuperview()
            make.size.equalTo(Constants.firstLeagueImageViewSize)
        }
        
        roundTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstLeagueImageView.snp.bottom)
            make.right.equalTo(self.snp.centerX).offset(Margins.tiny * -1)
        }

        roundContentLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(roundTitleLabel)
            make.left.equalTo(self.snp.centerX).offset(Margins.tiny)
        }
        
        
        seasonTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(roundTitleLabel.snp.bottom)
            make.right.equalTo(roundTitleLabel)
        }

        seasonContentLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(seasonTitleLabel)
            make.left.equalTo(roundContentLabel)
        }
        
        locationContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(seasonTitleLabel.snp.bottom).offset(Margins.normal)
            make.centerX.equalToSuperview()
        }
        
        locationTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(locationContentLabel.snp.bottom)
            make.bottom.centerX.equalToSuperview()
        }
    }
}

extension MatchView {
    private func nextMatchLayout() {
        
    }
}
