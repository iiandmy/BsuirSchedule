//
//  GroupCell.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 5.06.22.
//

import UIKit

class GroupCell: UITableViewCell {

    static let cellIdentifier = "groupCellIdentifier"
    
    @IBOutlet weak var groupNumber: UILabel!
    @IBOutlet weak var courseNumber: UILabel!
    @IBOutlet weak var specialityName: UILabel!

    func setLayout(withGroup group: Group) {
        self.groupNumber.text = group.name
        self.courseNumber.text = group.course == .none ? "" : "\(group.course!) курс"
        self.specialityName.text = group.specialityName
    }
    
}
