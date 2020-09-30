//
//  StartupViewController.swift
//  FCJ
//

import UIKit
import SnapKit

class StartupViewController: UIViewController {
    
    let testView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        
        addTestView()
        
        setupConstraints()
    }
    
    private func addTestView() {
        testView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        
        view.addSubview(testView)
    }
    
    private func setupConstraints() {
        testView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
    }
}
