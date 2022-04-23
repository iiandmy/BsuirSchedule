//
//  ViewController.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 26.03.22.
//

import UIKit

class ScheduleViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var facultyLabel: UILabel!
    
    // MARK: Dependencies
    var presenter: SchedulePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Show")
    }

    @IBAction func didTappedButton(_ sender: Any) {
        self.presenter.showFacultyName()
    }
    
}

extension ScheduleViewController: ScheduleViewProtocol {
    func succesScheduleLoad(facultyName: String) {
        self.facultyLabel.text = facultyName
    }
    
    func failureScheduleLoad(error: String) {
        self.facultyLabel.text = error
    }
    
    
}
