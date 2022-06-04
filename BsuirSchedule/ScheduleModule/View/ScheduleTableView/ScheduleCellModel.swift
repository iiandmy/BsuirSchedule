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
    
    func setLayout(withSubject subject: String, professorName: (first: String, last: String, middle: String), startTime: String, endTime: String, auditory: String, pairType: String) {
        if subjectName == nil {
            return
        }
        
        self.subjectName.text = subject
        self.professorSurname.text = professorName.last
        self.professorFirstMiddleName.text = "\(professorName.first) \(professorName.middle)"
        self.startTime.text = startTime
        self.endTime.text = endTime
        self.auditory.text = auditory
        
        let cellColor: UIColor!
        switch pairType {
        case "ЛК": cellColor = .systemBlue
        case "ПЗ": cellColor = .systemYellow
        case "ЛР": cellColor = .systemRed
        default: cellColor = .systemBlue
        }
        
        self.subjectName.textColor = cellColor
        self.sideBarIndicator.backgroundColor = cellColor
        
    }
}
