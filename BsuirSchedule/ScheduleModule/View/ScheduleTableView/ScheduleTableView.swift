//
//  ScheduleTableView.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 15.05.22.
//

import UIKit

class ScheduleTableView: UITableView {
    
    var schedule: Schedule!
    
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
        delegate = self
        dataSource = self
        allowsSelection = false
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func registerCell() {
        let scheduleCell = UINib(nibName: "ScheduleCell", bundle: nil)
        register(scheduleCell, forCellReuseIdentifier: ScheduleCell.cellIdentifier)
    }
}

extension ScheduleTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: ScheduleCell.cellIdentifier, for: indexPath)
        
        return cell
    }
}

extension ScheduleTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}
