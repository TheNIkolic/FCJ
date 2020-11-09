//
//  CompetitionsDataViewController.swift
//  FCJ
//

import UIKit

class CompetitionsDataViewController: BaseViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Manage Competitions Data"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white , NSAttributedString.Key.font: UIFont.fcjBoldFont(ofSize: FontSize.regular)!]
        navigationItem.rightBarButtonItem?.title = ""
    }
}
