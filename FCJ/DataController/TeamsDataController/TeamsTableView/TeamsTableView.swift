//
//  TeamsTableView.swift
//  FCJ
//

import UIKit

private struct Constants {
    static let rowHeight: CGFloat = 100
}

class TeamsTableView: UITableView {
    
    var teamsDataSource: [Team] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        dataSource = self
        register(TeamsTableViewCell.self, forCellReuseIdentifier: TeamsTableViewCell.reuseIdentifier)
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        rowHeight = Constants.rowHeight
        
        setupDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDataSource() {
        dataProvider.getAllTeams { (teams) in
            self.teamsDataSource = teams
            self.reloadData()
        } failHandler: { (error) in
            print(error.message)
        }
    }
}

extension TeamsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamsTableViewCell.reuseIdentifier, for: indexPath)
        
        guard let teamsCell = cell as? TeamsTableViewCell else {
            return cell
        }
        
        let teamsData = teamsDataSource[indexPath.row]
        
        teamsCell.teamImage = UIImage(named: teamsData.imageName)
        teamsCell.teamName = teamsData.name
        
        return teamsCell
    }
}
