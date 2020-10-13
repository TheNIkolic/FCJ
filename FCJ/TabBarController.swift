//
//  TabBarController.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let tabImageOffset: UIEdgeInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
}

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let homeTab: StartupViewController = StartupViewController()
    let notificationTab: UIViewController = UIViewController()
    let profileTab: UIViewController = UIViewController()
    let accountSettingsTab: UIViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        tabBarItemAppearance()
        
        viewControllers = [homeTab, notificationTab, profileTab, accountSettingsTab]
    }
    
    private func tabBarItemAppearance() {
//        homeTab.tabBarItem.image = UIImage(named: "homeIcon")?.withRenderingMode(.alwaysOriginal)
//        homeTab.tabBarItem.imageInsets = Constants.tabImageOffset
//        homeTab.tabBarItem.selectedImage = UIImage(named: "homeIconSelcted")?.withRenderingMode(.alwaysOriginal)
//        notificationTab.tabBarItem.image = UIImage(named: "notificationIcon")?.withRenderingMode(.alwaysOriginal)
//        notificationTab.tabBarItem.imageInsets = Constants.tabImageOffset
//        notificationTab.tabBarItem.selectedImage = UIImage(named: "notificationIconSelected")?.withRenderingMode(.alwaysOriginal)
//        profileTab.tabBarItem.image = UIImage(named: "profileIcon")?.withRenderingMode(.alwaysOriginal)
//        profileTab.tabBarItem.imageInsets = Constants.tabImageOffset
//        profileTab.tabBarItem.selectedImage = UIImage(named: "profileIconSelected")?.withRenderingMode(.alwaysOriginal)
//        accountSettingsTab.tabBarItem.image = UIImage(named: "accountSettingsIcon")?.withRenderingMode(.alwaysOriginal)
//        accountSettingsTab.tabBarItem.imageInsets = Constants.tabImageOffset
//        accountSettingsTab.tabBarItem.selectedImage = UIImage(named: "accountSettingsIconSelected")?.withRenderingMode(.alwaysOriginal)
    }
    
    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}

