//
//  ScheduleTableView.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 15.05.22.
//

import UIKit

class ScheduleTableView: UITableView {
    
    private var schedule: [Pair]!
    
    init() {
        super.init(frame: .zero, style: .plain)
        registerCell()
        makeSettings()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeSettings()
    }
    
    func makeSettings() {
        alwaysBounceVertical = false
        delegate = self
        dataSource = self
        allowsSelection = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func registerCell() {
        let scheduleCell = UINib(nibName: "ScheduleCell", bundle: nil)
        register(scheduleCell, forCellReuseIdentifier: ScheduleCell.cellIdentifier)
    }
    
    func setSchedule(_ pairs: [Pair]) {
        self.schedule = pairs
    }
}

extension ScheduleTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: ScheduleCell.cellIdentifier, for: indexPath) as! ScheduleCell
        
        cell.setLayout(withPair: schedule[indexPath.row])
        
        return cell
    }
}

extension ScheduleTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}
