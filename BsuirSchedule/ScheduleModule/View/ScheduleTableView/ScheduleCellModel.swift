//
//  ScheduleCell.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 14.05.22.
//

import UIKit

class ScheduleCell: UITableViewCell {
    
    static let cellIdentifier = "ScheduleCell"

    @IBOutlet weak var sideBarIndicator: UIView!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var professorSurname: UILabel!
    @IBOutlet weak var professorFirstMiddleName: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var auditory: UILabel!
    @IBOutlet weak var subgroupNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUI() {
        self.sideBarIndicator.layer.cornerRadius = 5
    }
    
    func setLayout(withPair pair: Pair?) {
        guard let pair = pair else { return }
        guard let professor = pair.employees.first else { return }
        
        self.subjectName.text = pair.subject
        self.professorSurname.text = professor.lastName
        self.professorFirstMiddleName.text = "\(professor.firstName) \(professor.middleName)"
        self.startTime.text = pair.startLessonTime
        self.endTime.text = pair.endLessonTime
        self.auditory.text = pair.auditories.first ?? ""
        switch pair.numSubgroup {
        case 1...2: self.subgroupNum.text = "\(pair.numSubgroup) подгруппа"
        default: self.subgroupNum.text = ""
        }
        
        let cellColor: UIColor!
        switch pair.lessonTypeAbbrev {
        case "ЛК": cellColor = .systemBlue
        case "ПЗ": cellColor = .systemYellow
        case "ЛР": cellColor = .systemRed
        default: cellColor = .systemBlue
        }
        
        self.subjectName.textColor = cellColor
        self.sideBarIndicator.backgroundColor = cellColor
    }
}
