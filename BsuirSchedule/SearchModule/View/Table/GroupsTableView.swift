//
//  GroupsTableView.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 5.06.22.
//

import UIKit

class GroupsTableView: UITableView {
    
    private var groups = [Group]()
    
    var viewDelegate: SearchViewDelegate!
    
    init() {
        super.init(frame: .zero, style: .plain)
        
        makeSettings()
        registerCell()
    }
    
    func makeSettings() {
        delegate = self
        dataSource = self
        allowsSelection = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func registerCell() {
        let groupCell = UINib(nibName: "GroupCell", bundle: nil)
        register(groupCell, forCellReuseIdentifier: GroupCell.cellIdentifier)
    }
    
    func setGroups(_ groups: [Group]) {
        DispatchQueue.main.async {
            self.groups = groups
            self.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension GroupsTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = groups[indexPath.row]
        viewDelegate.setGroup(group)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: GroupCell.cellIdentifier, for: indexPath) as! GroupCell
        
        cell.setLayout(withGroup: groups[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
