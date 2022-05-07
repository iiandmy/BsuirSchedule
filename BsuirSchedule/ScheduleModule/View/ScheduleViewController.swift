//
//  ViewController.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 26.03.22.
//

import UIKit

protocol ScheduleViewProtocol: AnyObject {
    func succesScheduleLoad(facultyName: String)
    func failureScheduleLoad(error: String)    
}

class ScheduleViewController: UIViewController {

    // MARK: Dependencies
    var presenter: SchedulePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
    }
    
}

extension ScheduleViewController: ScheduleViewProtocol {
    func succesScheduleLoad(facultyName: String) {
        print(facultyName)
    }
    
    func failureScheduleLoad(error: String) {
        print(error)
    }
    
    
}
