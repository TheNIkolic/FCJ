//
//  TabBarController.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let headerViewSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 3)
}

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private let headerView: UIImageView = UIImageView(image: UIImage(named: "FCJheaderImage"))
    
    let homeTab: HomeViewController = HomeViewController()
    let matchesTab: MatchesViewController = MatchesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        
        addHeaderView()
        
        setupConstraints()
    }
    
    private func setupViewControllers() {
        
        tabBarItemAppearance()
        
        viewControllers = [homeTab, matchesTab]
    }
    
    private func tabBarItemAppearance() {
        homeTab.tabBarItem.title = "Home"
        matchesTab.tabBarItem.title = "Matches"
    }
    
    private func addHeaderView() {
        headerView.contentMode = .scaleAspectFill
        headerView.applyShadowWith(color: UIColor.fcjBlack, offset: CGSize(width: 0, height: 4), opacity: 1, radius: 10)
        headerView.addTap {
            self.present(UINavigationController(rootViewController: BaseDataController()), animated: true)
        }
        
        view.addSubview(headerView)
    }
    
    private func setupConstraints() {
        headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(Constants.headerViewSize)
        }
    }
}

