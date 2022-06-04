//
//  Timetable.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 4.06.22.
//

import Foundation

struct Pair: Codable {
    let auditories: [String]
    let startLessonTime: String
    let endLessonTime: String
    let lessonTypeAbbrev: String
    let note: String?
    let numSubgroup: Int
    let subject: String
    let subjectFullName: String
    let weekNumber: [Int]
    let employees: [Employee]
}
