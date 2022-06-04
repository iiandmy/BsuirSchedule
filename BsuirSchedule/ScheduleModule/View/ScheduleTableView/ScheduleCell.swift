//
//  ScheduleCellTableViewCell.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 16.05.22.
//

import UIKit

class ScheduleCell: UITableViewCell {

    static let reuseIdentifier = "ScheduleCell"
    let colorBar: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
