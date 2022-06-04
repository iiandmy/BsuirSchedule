//
//  ScheduleNavBar.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 15.05.22.
//

import UIKit

class ScheduleNavBar: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var navBarTitle: UILabel!
    @IBOutlet weak var chooseDayButton: UIButton!
    @IBOutlet weak var examsButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
    }
    
    private func setLayout() {
        let bundle = Bundle(for: ScheduleNavBar.self)
        bundle.loadNibNamed("ScheduleNavBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func chooseDayButtonPressed(_ sender: Any) {
    }
    
    @IBAction func examsButtonPressed(_ sender: Any) {
    }
    
}
