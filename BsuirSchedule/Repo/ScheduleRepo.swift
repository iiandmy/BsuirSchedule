//
//  File.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 6.06.22.
//

import Foundation

class ScheduleRepo {
    static let shared = ScheduleRepo()
    private init() {}
    
    var schedule: Schedule?
    var currentWeek: Int?
}
