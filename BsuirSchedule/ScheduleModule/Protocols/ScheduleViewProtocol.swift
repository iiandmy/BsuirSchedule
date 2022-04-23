//
//  ScheduleViewProtocol.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 24.04.22.
//

import Foundation

protocol ScheduleViewProtocol: AnyObject {

    func succesScheduleLoad(facultyName: String)    
    func failureScheduleLoad(error: String)
    
}
