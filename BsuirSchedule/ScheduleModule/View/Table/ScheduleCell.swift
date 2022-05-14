//
//  ScheduleCell.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 14.05.22.
//

import UIKit

class ScheduleCell: UITableViewCell {

    @IBOutlet weak var sideBarIndicator: UIView!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var professorName: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var auditory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLayout(withSubject subject: String, professor: String, startTime: String, endTime: String, auditory: String, pairType: String) {
        if subjectName == nil {
            return
        }
        
        self.subjectName.text = subject
        self.professorName.text = professor
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
