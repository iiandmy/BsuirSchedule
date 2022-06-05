//
//  Employee.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 4.06.22.
//

import Foundation

struct Employee: Codable {
    let id: Int
    let firstName: String
    let middleName: String
    let lastName: String
    let photoLink: String?
}
