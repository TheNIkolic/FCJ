//
//  StartupViewController.swift
//  FCJ
//

import UIKit
import SnapKit

private struct Constants {
    static let headerViewSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 3)
    static let nextGameViewSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
}

class StartupViewController: BaseViewController {
    
    private let headerView: UIImageView = UIImageView(image: UIImage(named: "FCJheaderImage"))
    private let nextGameView: NextGameView = NextGameView()
    private let leaveCommentButton: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHeaderView()
        addNextGameView()
        addLeaveCommentButton()
        
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("pojavio sam se")
    }
    
    private func addHeaderView() {
        headerView.contentMode = .scaleAspectFill
        headerView.applyShadowWith(color: UIColor.fcjBlack, offset: CGSize(width: 0, height: 4), opacity: 1, radius: 10)
        headerView.addTap {
            //self.present(BaseDataController(), animated: true)
            self.present(UINavigationController(rootViewController: BaseDataController()), animated: true)
        }
        
        view.addSubview(headerView)
    }
    
    private func addNextGameView() {
        nextGameView.kickOffDate = "12.10."
        nextGameView.kickOffTime = "15:00"
        nextGameView.season = "2020/2021"
        nextGameView.round = "10"
        nextGameView.homeTeamName = "GFK Dubočica \nLeskovac"
        nextGameView.homeTeamImage = UIImage(named: "fkJagodinaLogo")
        nextGameView.awayTeamName = "GFK Jagodina"
        nextGameView.awayTeamImage = UIImage(named: "fkJagodinaLogo")
        nextGameView.location = "Gradski Stadion Leskovac"
        
        view.addSubview(nextGameView)
    }
    
    private func addLeaveCommentButton() {
        leaveCommentButton.backgroundColor = UIColor.gray
        
        view.addSubview(leaveCommentButton)
    }
    
    private func setupConstraints() {
        headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.centerX.equalToSuperview()
            make.size.equalTo(Constants.headerViewSize)
        }
        
        nextGameView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(Constants.nextGameViewSize)
        }
        
        leaveCommentButton.snp.makeConstraints { (make) in
            make.top.equalTo(nextGameView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
    }
}
