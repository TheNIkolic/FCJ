//
//  MatchesViewController.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let segments: [String] = ["SLEDE", "PRETHODNI"]
    static let matchesSegmentedControlHeight: CGFloat = 40
    static let fadeViewHeight: CGFloat = 75
    static let nextMatchesTableRrowHeight: CGFloat = 160
    static let previousMatchesTableRrowHeight: CGFloat = 200
}

class MatchesViewController: BaseViewController {
    
    private let matchesSegmentedControl: UISegmentedControl = UISegmentedControl(items: Constants.segments)
    private let fadeView: FCJGradientView = FCJGradientView()
    private let nextMatchesTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    private let previousMatchesTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    fileprivate var nextMatchesDataSource = [Dictionary<Int, [Match]>.Element]()
    fileprivate var previousMatchesDataSource = [Dictionary<Int, [Match]>.Element]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSources()
        
        addMatchesSegmentedControl()
        addFadeView()
        addNextMatchesTableView()
        addPreviousMatchesTableView()
        
        setupConstraints()
        
        view.bringSubviewToFront(fadeView)
    }
    
    private func setupDataSources() {
        dataProvider.getPreviousMatches { (matches) in
            let sortedPreviousMatches = matches.sorted { $0.kickOffDate > $1.kickOffDate}
            let sortedAndGroupedByDate = Dictionary(grouping: sortedPreviousMatches) { $0.kickOffDate.month }.sorted(by: {$0.0 > $1.0})
            self.previousMatchesDataSource = sortedAndGroupedByDate
            self.previousMatchesTableView.reloadData()
            
        } failHandler: { (error) in
            print(error.message)
        }
        
        dataProvider.getNextMatches { (matches) in
            let sortedNextMatches = matches.sorted { $0.kickOffDate < $1.kickOffDate}
            let sortedAndGroupedByDate = Dictionary(grouping: sortedNextMatches) { $0.kickOffDate.month }.sorted(by: {$0.0 < $1.0})
            self.nextMatchesDataSource = sortedAndGroupedByDate
            self.nextMatchesTableView.reloadData()
        } failHandler: { (error) in
            print(error.message)
        }
    }
    
    private func addMatchesSegmentedControl() {
        matchesSegmentedControl.backgroundColor = UIColor.fcjWhite
        matchesSegmentedControl.selectedSegmentTintColor = UIColor.fcjDefaultBlue
        matchesSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.fcjWhite], for: .selected)
        matchesSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.fcjBlack], for: .normal)
        matchesSegmentedControl.selectedSegmentIndex = .zero
        matchesSegmentedControl.addTarget(self, action: #selector(self.segmentToggle(_:)), for: .valueChanged)
        
        view.addSubview(matchesSegmentedControl)
    }
    
    private func addFadeView() {
        fadeView.gradientSettings.orientation = .vertical
        fadeView.gradientSettings.colors = [UIColor.fcjWhite, UIColor.fcjWhite.withAlphaComponent(AlphaComponent.fullyTransparent)]
        
        view.addSubview(fadeView)
    }
    
    private func addNextMatchesTableView() {
        nextMatchesTableView.isHidden = false
        nextMatchesTableView.alpha = AlphaComponent.fullyVisible
        nextMatchesTableView.dataSource = self
        nextMatchesTableView.delegate = self
        nextMatchesTableView.register(NextMatchesTableViewCell.self, forCellReuseIdentifier: NextMatchesTableViewCell.reuseIdentifier)
        nextMatchesTableView.separatorStyle = .none
        nextMatchesTableView.showsVerticalScrollIndicator = false
        nextMatchesTableView.rowHeight = Constants.nextMatchesTableRrowHeight
        nextMatchesTableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        nextMatchesTableView.backgroundColor = UIColor.fcjClear
        
        view.addSubview(nextMatchesTableView)
    }
    
    private func addPreviousMatchesTableView() {
        previousMatchesTableView.isHidden = true
        previousMatchesTableView.alpha = AlphaComponent.fullyTransparent
        previousMatchesTableView.dataSource = self
        previousMatchesTableView.delegate = self
        previousMatchesTableView.register(PreviousMatchTableViewCell.self, forCellReuseIdentifier: PreviousMatchTableViewCell.reuseIdentifier)
        previousMatchesTableView.separatorStyle = .none
        previousMatchesTableView.showsVerticalScrollIndicator = false
        previousMatchesTableView.rowHeight = Constants.previousMatchesTableRrowHeight
        previousMatchesTableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        previousMatchesTableView.backgroundColor = UIColor.fcjClear
        
        view.addSubview(previousMatchesTableView)
    }
    
    private func setupConstraints() {
        matchesSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(mainTopOffset + Margins.regular)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(SizeMultiplayers.medium)
            make.height.equalTo(Constants.matchesSegmentedControlHeight)
        }
        
        fadeView.snp.makeConstraints { (make) in
            make.top.equalTo(matchesSegmentedControl.snp.bottom)
            make.width.centerX.equalToSuperview()
            make.height.equalTo(Constants.fadeViewHeight)
        }
        
        nextMatchesTableView.snp.makeConstraints { (make) in
            make.top.equalTo(matchesSegmentedControl.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        previousMatchesTableView.snp.makeConstraints { (make) in
            make.top.equalTo(matchesSegmentedControl.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    @objc private func segmentToggle(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: AnimationDuration.fast) {
                self.previousMatchesTableView.alpha = AlphaComponent.fullyTransparent
            } completion: { (_) in
                self.previousMatchesTableView.isHidden = true
                self.nextMatchesTableView.isHidden = false
                
                UIView.animate(withDuration: AnimationDuration.fast) {
                    self.nextMatchesTableView.alpha = AlphaComponent.fullyVisible
                }
            }
        case 1:
            UIView.animate(withDuration: AnimationDuration.fast) {
                self.nextMatchesTableView.alpha = AlphaComponent.fullyTransparent
            } completion: { (_) in
                self.nextMatchesTableView.isHidden = true
                self.previousMatchesTableView.isHidden = false
                
                UIView.animate(withDuration: AnimationDuration.fast) {
                    self.previousMatchesTableView.alpha = AlphaComponent.fullyVisible
                }
            }
        default:
            break
        }
    }
}

extension MatchesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        var count: Int = 0
        
        if tableView == nextMatchesTableView {
            count =  nextMatchesDataSource.count
        }
        if tableView == previousMatchesTableView {
            count = previousMatchesDataSource.count
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView()
        let headerLabel: FCJLabel = FCJLabel()
        if tableView == nextMatchesTableView {
            headerLabel.text = nextMatchesDataSource[section].value.first?.kickOffDate.toString(dateFormat: "MMMM, yyyy") ?? ""
        }
        if tableView == previousMatchesTableView {
            headerLabel.text = previousMatchesDataSource[section].value.first?.kickOffDate.toString(dateFormat: "MMMM, yyyy") ?? ""
        }
        headerLabel.textColor = UIColor.fcjWhite
        headerLabel.font = UIFont.fcjBoldFont(ofSize: FontSize.small)
        headerLabel.backgroundColor = UIColor.fcjDefaultBlue
        headerLabel.layer.cornerRadius = Sizes.CornerRadius.regular
        headerLabel.clipsToBounds = true
        headerLabel.textAlignment = .center
        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(Sizes.Label.Height.big)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Sizes.Label.Height.big * 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int = 0
        
        if tableView == nextMatchesTableView {
            count =  nextMatchesDataSource[section].value.count
        }
        if tableView == previousMatchesTableView {
            count = previousMatchesDataSource[section].value.count
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var matchCell: UITableViewCell = UITableViewCell()
        
        if tableView == nextMatchesTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: NextMatchesTableViewCell.reuseIdentifier, for: indexPath)
            
            guard let nextMatchCell = cell as? NextMatchesTableViewCell else {
                return cell
            }
            
            let matchesData = nextMatchesDataSource[indexPath.section].value[indexPath.row]
            
            nextMatchCell.homeTeamImage = matchesData.homeTeam.imageUrl
            nextMatchCell.homeTeamName = matchesData.homeTeam.name
            nextMatchCell.homeTeamHomeTown = matchesData.homeTeam.homeTown
            nextMatchCell.awayTeamImage = matchesData.awayTeam.imageUrl
            nextMatchCell.awayTeamName = matchesData.awayTeam.name
            nextMatchCell.awayTeamHomeTown = matchesData.awayTeam.homeTown
            nextMatchCell.kickOffDate = matchesData.kickOffDate.toString(dateFormat: "dd.MM.yyyy")
            nextMatchCell.kickOffTime = matchesData.kickOffDate.toString(dateFormat: "HH:mm")
            nextMatchCell.competitionImage = matchesData.competition.imageUrl
            
            matchCell = nextMatchCell
        }
        
        
        if tableView == previousMatchesTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: PreviousMatchTableViewCell.reuseIdentifier, for: indexPath)
            
            guard let previousMatchCell = cell as? PreviousMatchTableViewCell else {
                return cell
            }
            
            let matchesData = previousMatchesDataSource[indexPath.section].value[indexPath.row]
            
            previousMatchCell.homeTeamImage = matchesData.homeTeam.imageUrl
            previousMatchCell.homeTeamScore = matchesData.homeTeamScore ?? 0
            previousMatchCell.homeTeamName = matchesData.homeTeam.name
            previousMatchCell.homeTeamHomeTown = matchesData.homeTeam.homeTown
            previousMatchCell.awayTeamImage = matchesData.awayTeam.imageUrl
            previousMatchCell.awayTeamScore = matchesData.awayTeamScore ?? 0
            previousMatchCell.awayTeamName = matchesData.awayTeam.name
            previousMatchCell.awayTeamHomeTown = matchesData.awayTeam.homeTown
            previousMatchCell.matchResult = matchesData.result ?? 0
            previousMatchCell.competitionImage = matchesData.competition.imageUrl
            previousMatchCell.kickOffDate = matchesData.kickOffDate.toString(dateFormat: "dd.MM.yyyy")
            previousMatchCell.kickOffTime = matchesData.kickOffDate.toString(dateFormat: "HH:mm")
            
            matchCell = previousMatchCell
        }
        
        return matchCell
    }
}

extension MatchesViewController: UITableViewDelegate {}
