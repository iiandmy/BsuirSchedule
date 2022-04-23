//
//  DaySchedule.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 23.04.22.
//

import Foundation

struct DaySchedule: Codable {
    let weekDay: String?
    let schedule: [Pair]?
}
