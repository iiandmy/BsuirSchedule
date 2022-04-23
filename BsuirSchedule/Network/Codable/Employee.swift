//
//  Employee.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 23.04.22.
//

import Foundation

struct Employee: Codable {
    let firstName: String?
    let lastName: String?
    let middleName: String?
    let degree: String?
    let rank: String?
    let photoLink: String?
    let academicDepartment: [String]?
    let id: Int?
    let urlId: String?
    let fio: String?
}
