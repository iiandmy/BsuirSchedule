//
//  SchedulePresenterProtocol.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 24.04.22.
//

import Foundation

protocol SchedulePresenterProtocol: AnyObject {
    
    init(view: ScheduleViewProtocol, schedule: Schedule?)
    func showFacultyName()
    
}
