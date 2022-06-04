//
//  ScheduleTable.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 11.05.22.
//

import Foundation
import UIKit

class ScheduleTable: UITableView {
    
    init() {
        super.init(frame: CGRect(), style: .plain)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeUI()
    }
    
    func makeUI() {
        
    }
}

extension ScheduleTable: UITableViewDelegate {}

extension ScheduleTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}
