//
//  Pair.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 23.04.22.
//

import Foundation

struct Pair: Codable {
    let weekNumber: [Int]?
    let studentGroup: [String]?
    let numSubgroup: Int?
    let auditory: [String]?
    let startLessonTime: String?
    let endLessonTime: String?
    let subject: String?
    let subjectFullName: String?
    let note: String?
    let lessonType: String?
    let employee: [Employee]?
    let zaoch: Bool?
}
