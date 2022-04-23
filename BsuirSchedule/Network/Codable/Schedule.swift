//
//  Schedule.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 23.04.22.
//

import Foundation

struct Schedule: Codable {
    let studentGroup: Group?
    let schedules: [DaySchedule]?
    let examSchedules: [DaySchedule]?
    let todayDate: Date?
    let dateStart: Date?
    let dateEnd: Date?
    let sessionStart: Date?
    let sessionEnd: Date?
}
