//
//  EmployeeSchedule.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 23.04.22.
//

import Foundation

struct EmployeeSchedule: Codable {
    let employee: [Employee]?
    let studentGroup: Group?
    let schedules: [DaySchedule]?
    let examSchedules: [DaySchedule]?
    let todayDate: Date?
    let todaySchedules: [DaySchedule]?
    let tomorrowSchedules: [DaySchedule]?
    let currentWeekNumber: Int?
    let dateStart: Date?
    let dateEnd: Date?
    let sessionStart: Date?
    let sessionEnd: Date?
}
