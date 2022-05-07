//
//  SchedulePresenter.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 24.04.22.
//

import Foundation

protocol SchedulePresenterProtocol: AnyObject {
    init(view: ScheduleViewProtocol, schedule: Schedule?)
    func showFacultyName()
}

class SchedulePresenter: SchedulePresenterProtocol {
    
    let view: ScheduleViewProtocol
    var schedule: Schedule?
    
    required init(view: ScheduleViewProtocol, schedule: Schedule?) {
        self.view = view
        self.schedule = schedule
    }
    
    func showFacultyName() {
        guard let facultyName = schedule?.studentGroup?.facultyName else {
            self.view.failureScheduleLoad(error: "Schedule not loaded yet")
            return
        }
        
        self.view.succesScheduleLoad(facultyName: facultyName)
    }
        
}
