//
//  HomeViewController.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let headerViewSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 3)
    static let nextGameViewSize = CGSize(width: UIScreen.main.bounds.width, height: 220)
}

class HomeViewController: BaseViewController {
    
    private let nextGameView: MatchView = MatchView()
    private let titleLabelBackgroundView: UIView = UIView()
    private let titleLabel: FCJLabel = FCJLabel()
    private let leaveCommentButton: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNextGameView()
        addTitleLabelBackgroundView()
        addTitleLabel()
        addLeaveCommentButton()
        
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        let currentDate = Date()
//
//        let iso8601DateFormatter = ISO8601DateFormatter()
//        iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withTimeZone]
//        let string = iso8601DateFormatter.string(from: currentDate)
//
//        print("ovo se salje" + " " + string)
//
//        let comp: Competition = Competition()
//        comp.id = 2
//
//        let ht: Team = Team()
//        ht.id = 8
//
//        let at: Team = Team()
//        at.id = 13
//
//        let req: MatchRequest = MatchRequest()
//        req.competition = comp
//        req.homeTeam = ht
//        req.awayTeam = at
//        req.kickOffDate = string
//        req.location = "Voljavce"
//
//        print(req.competition)
//
//        dataProvider.createMatch(request: req) { (match) in
//            print("ovo se prima" + " ")
//            print(match.kickOffDate)
//        } failHandler: { (error) in
//            print(error.message)
//        }

        dataProvider.getNextMatch { (nextMatch) in
            
            self.nextGameView.homeTeamImage = nextMatch.homeTeam.imageUrl
            self.nextGameView.homeTeamName = nextMatch.homeTeam.name
            self.nextGameView.homeTeamHomeTown = nextMatch.homeTeam.homeTown
            self.nextGameView.awayTeamImage = nextMatch.awayTeam.imageUrl
            self.nextGameView.awayTeamName = nextMatch.awayTeam.name
            self.nextGameView.awayTeamHomeTown = nextMatch.awayTeam.homeTown
            self.nextGameView.kickOffDate = nextMatch.kickOffDate.toString(dateFormat: "dd. MMM yyyy")
            self.nextGameView.kickOffTime = nextMatch.kickOffDate.toString(dateFormat: "HH:mm")
            self.nextGameView.competitionImage = nextMatch.competition.imageUrl
            self.nextGameView.comptetitionStageName = nextMatch.competition.stageName
            self.nextGameView.season = nextMatch.season
            self.nextGameView.round = nextMatch.stage
            self.nextGameView.location = nextMatch.location
        } failHandler: { (error) in
            print(error.message)
        }
    }
    
    private func addNextGameView() {
        view.addSubview(nextGameView)
    }
    
    private func addTitleLabelBackgroundView() {
        titleLabelBackgroundView.layer.borderColor = UIColor.fcjDefaultBlue.cgColor
        titleLabelBackgroundView.layer.borderWidth = Sizes.BorderWidth.regular
        titleLabelBackgroundView.layer.cornerRadius = Sizes.CornerRadius.large
        
        view.addSubview(titleLabelBackgroundView)
    }
    
    private func addTitleLabel() {
        titleLabel.text = "sledeća utakmica".uppercased()
        titleLabel.textColor = UIColor.fcjWhite
        titleLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.normal)
        titleLabel.backgroundColor = UIColor.fcjDefaultBlue
        titleLabel.layer.cornerRadius = Sizes.CornerRadius.regular
        titleLabel.clipsToBounds = true
        titleLabel.textAlignment = .center
        
        titleLabelBackgroundView.addSubview(titleLabel)
    }
    
    private func addLeaveCommentButton() {
        leaveCommentButton.backgroundColor = UIColor.gray
        
        view.addSubview(leaveCommentButton)
    }
    
    private func setupConstraints() {
        nextGameView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(Margins.extraBig)
            make.centerX.equalToSuperview()
            make.width.equalTo(Constants.nextGameViewSize.width)
        }
        
        titleLabelBackgroundView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextGameView.snp.top).inset(Margins.normal * -1)
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.normal)
            make.height.equalTo(Sizes.Label.Height.large)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.extraBig)
            make.height.equalToSuperview().multipliedBy(SizeMultiplayers.normal)
        }
        
        leaveCommentButton.snp.makeConstraints { (make) in
            make.top.equalTo(nextGameView.snp.bottom).offset(Margins.normal)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.standard)
            make.height.equalTo(Sizes.Button.Height.big)
        }
    }
}
