//
//  MatchesViewController.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let segments: [String] = ["SLEDE", "PRETHODNI"]
    static let rowHeight: CGFloat = 200
}

class MatchesViewController: BaseViewController {
    
    private let matchesSegmentedControl: UISegmentedControl = UISegmentedControl(items: Constants.segments)
    private let fadeView: FCJGradientView = FCJGradientView()
    private let matchesTableView: UITableView = UITableView()
    
    var matchesDataSource: [Match] = []
    
    var nextMatchesDataSource: [Match] = []
    var previousMatchesDataSource: [Match] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMatchesSegmentedControl()
        addFadeView()
        addMatchesTableView()
        
        setupConstraints()
        
        dataProvider.getAllMatches { (matches) in
            self.matchesDataSource = matches
            self.matchesTableView.reloadData()
            
        } failHandler: { (error) in
            print(error.message)
        }
        
        view.bringSubviewToFront(fadeView)
    }
    
    private func addMatchesSegmentedControl() {
        matchesSegmentedControl.selectedSegmentIndex = .zero
        
        view.addSubview(matchesSegmentedControl)
    }
    
    private func addFadeView() {
        fadeView.gradientSettings.orientation = .vertical
        fadeView.gradientSettings.colors = [UIColor.fcjWhite, UIColor.fcjWhite.withAlphaComponent(AlphaComponent.fullyTransparent)]
        
        view.addSubview(fadeView)
        
    }
    
    private func addMatchesTableView() {
        matchesTableView.dataSource = self
        matchesTableView.delegate = self
        matchesTableView.register(MatchesTableViewCell.self, forCellReuseIdentifier: MatchesTableViewCell.reuseIdentifier)
        matchesTableView.separatorStyle = .none
        matchesTableView.showsVerticalScrollIndicator = false
        matchesTableView.estimatedRowHeight = Constants.rowHeight
        matchesTableView.rowHeight = UITableView.automaticDimension
        matchesTableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        matchesTableView.backgroundColor = UIColor.fcjClear
        
        view.addSubview(matchesTableView)
    }
    
    private func setupConstraints() {
        matchesSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(mainTopOffset)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.medium)
            make.height.equalTo(40)
        }
        
        fadeView.snp.makeConstraints { (make) in
            make.top.equalTo(matchesSegmentedControl.snp.bottom)
            make.width.centerX.equalToSuperview()
            make.height.equalTo(75)
        }
        
        matchesTableView.snp.makeConstraints { (make) in
            make.top.equalTo(matchesSegmentedControl.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
}

extension MatchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchesDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchesTableViewCell.reuseIdentifier, for: indexPath)
        
        guard let matchCell = cell as? MatchesTableViewCell else {
            return cell
        }
        
        let matchesData = matchesDataSource[indexPath.row]
        
        matchCell.homeTeamImage = matchesData.homeTeam.imageUrl
        matchCell.homeTeamName = matchesData.homeTeam.name
        matchCell.homeTeamHomeTown = matchesData.homeTeam.homeTown
        matchCell.awayTeamImage = matchesData.awayTeam.imageUrl
        matchCell.awayTeamName = matchesData.awayTeam.name
        matchCell.awayTeamHomeTown = matchesData.awayTeam.homeTown
//        matchCell.kickOffDate = matchesData.kickOffDate.toString(dateFormat: "dd.MM.yyyy")
//        matchCell.kickOffTime = matchesData.kickOffDate.toString(dateFormat: "HH:mm")
        
        return matchCell
    }
}

extension MatchesViewController: UITableViewDelegate {}
